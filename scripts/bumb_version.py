import yaml
import sys

file_path = "pubspec.yaml"
version_type = sys.argv[1]  # minor / patch / build

with open(file_path, 'r') as f:
    data = yaml.safe_load(f)

version = data['version']
semver, build = version.split('+')
major, minor, patch = map(int, semver.split('.'))
build = int(build)

# MINOR
# Changé quand tu ajoutes des fonctionnalités compatibles avec l'existant.
# Ex : ajout d’un nouvel écran, d’un champ, d’une nouvelle commande, etc.
# Exemple : de 1.2.3+5 → 1.3.0+0
if version_type == "minor":
    minor += 1
    patch = 0
    build = 0
# PATCH
# Changé quand tu fais des corrections de bugs, optimisations, 
# ou des petits changements internes sans impact fonctionnel.
# Exemple : de 1.3.0+0 → 1.3.1+0
elif version_type == "patch":
    patch += 1
    build = 0
# BUILD (Flutter spécifique)
# Indique le numéro de build ou de compilation.
# Ne modifie pas la sémantique fonctionnelle du code, mais utile pour savoir quelle version exacte a été générée.
# C’est le seul champ obligatoire dans Flutter pour que flutter build fonctionne.
# Exemple : de 1.3.1+0 → 1.3.1+1
elif version_type == "build":
    build += 1
else:
    raise ValueError("Invalid version type")

data['version'] = f"{major}.{minor}.{patch}+{build}"

with open(file_path, 'w') as f:
    yaml.dump(data, f, sort_keys=False)
