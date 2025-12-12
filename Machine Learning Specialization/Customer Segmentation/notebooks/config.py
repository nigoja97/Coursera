import yaml
from pathlib import Path


class Paths:
    """
    Carga y resuelve todos los paths definidos en paths.yml.
    Convierte cada entrada en un atributo accesible.
    """

    def __init__(self, yaml_path: str = "paths.yml"):
        # Ruta física del archivo config.py
        current_file = Path(__file__).resolve()

        # Subir niveles:
        # notebooks/ -> Customer Segmentation/ -> Machine Learning Specialization/
        self.project_root = current_file.parents[3]

        # Ruta del archivo YAML (relativa a notebooks/)
        yaml_path = (current_file.parent / yaml_path).resolve()

        if not yaml_path.exists():
            raise FileNotFoundError(f"El archivo de configuración no existe: {yaml_path}")

        # Cargar YAML
        with open(yaml_path, "r", encoding="utf-8") as f:
            config = yaml.safe_load(f)

        # Procesar secciones
        self._parse_section(config)

    def _parse_section(self, config: dict, prefix: str = ""):
        """
        Convierte cada path del YAML en un atributo del objeto.
        """
        for key, value in config.items():
            if isinstance(value, dict):
                self._parse_section(value, prefix=f"{prefix}{key}_")
            else:
                resolved_path = (self.project_root / value).resolve()
                setattr(self, f"{prefix}{key}", resolved_path)


# Test rápido
if __name__ == "__main__":
    paths = Paths()
