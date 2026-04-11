import { createFileRoute } from '@tanstack/react-router'
import api from  '@/api/axios'
import { useInfiniteQuery, useQuery } from '@tanstack/react-query';
import { useInView } from 'react-intersection-observer';
import { useEffect, useState } from 'react';
import CardDemo from '@/components/cards-demo-2';
import SearchBar from '@/components/searchbar';
import Filter from  '@/components/ui/filters';

export const Route = createFileRoute('/gallery/')({
  component: RouteComponent,
  loader: ({ context }) => {
    // 'context' contient automatiquement ton queryClient !
    console.log('Mon QueryClient est accessible ici :', context.queryClient)
    // Tu peux ici pré-charger tes données SQL via ton API
    // return context.queryClient.ensureQueryData(galeriesQueryOptions)
  },
})

interface Item{
  article_id:string,
  Pin_title:string,
  Pin_id:number,
  Pin_keywords:string,
  Pin_url:URLPattern,
  Pin_source:string,
  score:number,
  Pin_SubCategorie:string,
  Pin_Ambiance:string,
  Jobs:string,
  Pin_categorie:string,
  created_at:Date
}

const fetchItems = async ({ pageParam = 0 }) => {
  const limit = 20;
  const res = await api.get(`/items?skip=${pageParam}&limit=${limit}`);
  return res.data;
};

const fetchCategories = async () => {
  const res = await api.get(`/categories`);
  return res.data;
}

const fetchFilteredItems = async (categories: string[], search: string) => {
  const params = new URLSearchParams();
  categories.forEach(cat => params.append('categories', cat));
  if (search) {
    params.append('search', search);
  }
  const res = await api.get(`/items/?${params.toString()}`);
  return res.data;
}


function RouteComponent() {
  // État pour les filtres sélectionnés
  const [selectedFilters, setSelectedFilters] = useState<string[]>([]);
  const [debouncedFilters, setDebouncedFilters] = useState<string[]>([]);
  
  // État pour la recherche
  const [searchTerm, setSearchTerm] = useState<string>("");
  const [debouncedSearch, setDebouncedSearch] = useState<string>("");

  // Debounce : attendre 500ms après le dernier clic pour les filtres
  useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedFilters(selectedFilters);
    }, 500);

    return () => clearTimeout(timer);
  }, [selectedFilters]);

  // Debounce : attendre 500ms après le dernier caractère tapé pour la recherche
  useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedSearch(searchTerm);
    }, 500);

    return () => clearTimeout(timer);
  }, [searchTerm]);

  // Query pour les catégories
  const { data: categories = [] } = useQuery<string[]>({
    queryKey: ['categories'],
    queryFn: fetchCategories
  });

  // Query INFINIE pour les items sans filtres (scroll infini)
  const {
    data: infiniteData,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
    isLoading: isInfiniteLoading
  } = useInfiniteQuery({
    queryKey: ['items-infinite'],
    queryFn: fetchItems,
    initialPageParam: 0,
    getNextPageParam: (lastPage, allPages) => {
      if (lastPage.length < 20) return undefined;
      return allPages.length * 20;
    },
    enabled: debouncedFilters.length === 0 && !debouncedSearch // Actif SEULEMENT si pas de filtres ET pas de recherche
  });

  // Query NORMALE pour les items filtrés
  const {
    data: filteredItems = [],
    isLoading: isFilteredLoading
  } = useQuery({
    queryKey: ['items-filtered', debouncedFilters, debouncedSearch],
    queryFn: async () => {
      return await fetchFilteredItems(debouncedFilters, debouncedSearch);
    },
    enabled: debouncedFilters.length > 0 || debouncedSearch.length > 0 // Actif si filtres OU recherche
  });

  // Décider quel ensemble d'items afficher
  const allItems = (debouncedFilters.length > 0 || debouncedSearch.length > 0)
    ? filteredItems
    : infiniteData?.pages.flat() || [];

  const isLoading = (debouncedFilters.length > 0 || debouncedSearch.length > 0) ? isFilteredLoading : isInfiniteLoading;

  // Hook pour scroll infini
  const { ref, inView } = useInView();

  // Déclencher fetchNextPage quand on scrolle au bas (seulement en mode infini)
  useEffect(() => {
    if (inView && hasNextPage && debouncedFilters.length === 0 && !debouncedSearch) {
      fetchNextPage();
    }
  }, [inView, hasNextPage, fetchNextPage, debouncedFilters.length, debouncedSearch]);

  // Fonction pour toggle les filtres
  const handleFilterChange = (categorie: string) => {
    setSelectedFilters(prev =>
      prev.includes(categorie)
        ? prev.filter(f => f !== categorie)
        : [...prev, categorie]
    );
  };

  if (isLoading) return <div>Chargement...</div>

  return (
    <>
    <div className="flex flex-col gap-y-5 px-4 py-6 max-w-7xl mx-auto">
      <SearchBar value={searchTerm} onChange={setSearchTerm} />
      <hr className=""/>
      <div className="space-y-3">
        <p className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">Filtres</p>
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-2">
          {categories.map((categorie: string) => (
            <Filter
              key={categorie}
              categorie={categorie}
              isSelected={selectedFilters.includes(categorie)}
              onChange={() => handleFilterChange(categorie)}
            />
          ))}
        </div>
      </div>
      <hr />
    </div>

    {/* Display grid images */}
    <div className="px-4 pb-12 max-w-7xl mx-auto mt-40">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-y-12 gap-x-6">
        {allItems.map((item:Item) => (
          <CardDemo
            key={item.Pin_id}
            name={item.Pin_title}
            description={item.Pin_keywords}
            href={item.Pin_url.toString()}
            cta="Voir l'article"
            Icon={() => <div>{item.score}</div> }
            imageId={item.Pin_id}
          />
        ))}
      </div>

      <div ref={ref} className="h-10 mt-8 flex items-center justify-center">
        {isFetchingNextPage && <p className="text-sm text-muted-foreground">Chargement de la suite...</p>}
      </div>
    </div>
  </>)
}