import  { Cross2Icon  }  from "@radix-ui/react-icons";
import { Button } from "./button";

interface FilterProps {
  categorie: string;
  isSelected: boolean;
  onChange: () => void;
}

export default function Filter({ categorie, isSelected, onChange }: FilterProps) {
  return (
    <div>
      <Button 
        variant='default' 
        size='xs'
        onClick={onChange}
        className={isSelected ? "text-primary bg-primary-foreground" : ""}
      >
        {categorie} {isSelected && <Cross2Icon className="ml-0.5" />}
      </Button>
    </div>
  );
}