import { createFileRoute } from '@tanstack/react-router'
import { useQuery } from '@tanstack/react-query'
import api from '@/api/axios'
import { Link } from '@tanstack/react-router'

export const Route = createFileRoute('/gallery/$imageId')({
  component: RouteComponent,
})

interface ImageDetail {
  article_id: string
  Pin_title: string
  Pin_id: number
  Pin_keywords: string
  Pin_url: string
  Pin_source: string
  score: number
  Pin_SubCategorie: string
  Pin_Ambiance: string
  Jobs: string
  Pin_categorie: string
  created_at: Date
}

const fetchImageDetail = async (imageId: string): Promise<ImageDetail> => {
  const res = await api.get(`/items/${imageId}`)
  return res.data
}

function RouteComponent() {
  const params = Route.useParams()
  const imageId = params.imageId

  const { data: image, isLoading, isError } = useQuery({
    queryKey: ['image', imageId],
    queryFn: () => fetchImageDetail(imageId),
  })

  if (isLoading) return (
    <div className="flex items-center justify-center min-h-screen">
      <div className="text-lg text-gray-500">Chargement de l'image...</div>
    </div>
  )

  if (isError) return (
    <div className="flex items-center justify-center min-h-screen">
      <div className="text-lg text-red-500">Erreur lors du chargement</div>
    </div>
  )

  if (!image) return (
    <div className="flex items-center justify-center min-h-screen">
      <div className="text-lg text-gray-500">Image non trouvée</div>
    </div>
  )

  // Parse metadata
  const keywords = image.Pin_keywords?.split(', ') || []
  const jobs = image.Jobs?.split(', ') || []
  const ambiance = image.Pin_Ambiance?.split(', ') || []

  return (
    <div className="min-h-screen bg-background">
      {/* Header Navigation */}
      <div className="sticky top-0 z-40 border-b border-border bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
        <div className="px-4 py-3 flex items-center justify-between max-w-7xl mx-auto">
          <Link 
            to="/gallery"
            className="text-sm text-muted-foreground hover:text-foreground transition-colors"
          >
            ← Retour à la galerie
          </Link>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-4 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Image Column (Larger on desktop) */}
          <div className="lg:col-span-2">
            <div className="rounded-xl overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300 bg-card border border-border">
              <div className="relative aspect-video bg-muted overflow-hidden">
                <img 
                  src={image.Pin_url} 
                  alt={image.Pin_title}
                  className="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                />
              </div>
            </div>

            {/* Title & Source */}
            <div className="mt-6 space-y-3">
              <h1 className="text-4xl font-bold tracking-tight text-foreground">
                {image.Pin_title}
              </h1>
              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                <span className="inline-block w-2 h-2 rounded-full bg-primary"></span>
                Source: {image.Pin_source}
              </div>
            </div>

            {/* Call to Action */}
            <a 
              href={image.Pin_url} 
              target="_blank" 
              rel="noopener noreferrer"
              className="mt-6 inline-flex items-center justify-center px-6 py-3 bg-primary text-primary-foreground font-medium rounded-lg hover:bg-primary/90 transition-colors w-full lg:w-auto"
            >
              Voir l'article original →
            </a>
          </div>

          {/* Details Sidebar */}
          <div className="lg:col-span-1">
            <div className="space-y-4 sticky top-20">
              {/* Score Card */}
              <div className="rounded-lg border border-border bg-card p-4">
                <div className="text-center">
                  <div className="text-4xl font-bold text-primary mb-2">
                    {image.score}/10
                  </div>
                  <p className="text-sm text-muted-foreground">Score général</p>
                </div>
              </div>

              {/* Categorie Cards */}
              <div className="rounded-lg border border-border bg-card p-4 space-y-3">
                <div>
                  <h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-2">
                    Catégorie
                  </h3>
                  <p className="text-sm font-medium text-foreground">
                    {image.Pin_categorie}
                  </p>
                </div>
                <div className="pt-3 border-t border-border">
                  <h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-2">
                    Sous-Catégorie
                  </h3>
                  <p className="text-sm font-medium text-foreground">
                    {image.Pin_SubCategorie}
                  </p>
                </div>
              </div>

              {/* Keywords */}
              {keywords.length > 0 && (
                <div className="rounded-lg border border-border bg-card p-4 space-y-3">
                  <h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider">
                    Mots-clés ({keywords.length})
                  </h3>
                  <div className="flex flex-wrap gap-2">
                    {keywords.map((keyword, idx) => (
                      <span 
                        key={idx}
                        className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-secondary text-secondary-foreground"
                      >
                        {keyword.trim()}
                      </span>
                    ))}
                  </div>
                </div>
              )}

              {/* Ambiance */}
              {ambiance.length > 0 && (
                <div className="rounded-lg border border-border bg-card p-4 space-y-3">
                  <h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider">
                    Ambiance & Décor ({ambiance.length})
                  </h3>
                  <div className="space-y-2">
                    {ambiance.map((item, idx) => (
                      <div 
                        key={idx}
                        className="flex items-center gap-3 text-sm text-foreground"
                      >
                        <span className="w-1.5 h-1.5 rounded-full bg-primary flex-shrink-0"></span>
                        {item.trim()}
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Jobs */}
              {jobs.length > 0 && (
                <div className="rounded-lg border border-border bg-card p-4 space-y-3">
                  <h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider">
                    Métiers Correspondants ({jobs.length})
                  </h3>
                  <div className="flex flex-wrap gap-2">
                    {jobs.map((job, idx) => (
                      <span 
                        key={idx}
                        className="inline-flex items-center px-3 py-1.5 rounded-md text-xs font-medium bg-muted text-muted-foreground border border-border"
                      >
                        {job.trim()}
                      </span>
                    ))}
                  </div>
                </div>
              )}

              {/* Footer Metadata */}
              <div className="text-xs text-muted-foreground pt-4 border-t border-border text-center">
                <p>Article ID: {image.article_id}</p>
                <p className="mt-1">
                  {new Date(image.created_at).toLocaleDateString('fr-FR')}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
