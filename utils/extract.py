import zipfile
from pathlib import Path

def unzip_recursively(path):
    """
    Recursively unzip all zip files in the given directory and its subdirectories using pathlib.
    """
    path = Path(path)
    for zip_path in path.rglob('*.zip'):
        out_dir = zip_path.parent / zip_path.stem
        out_dir.mkdir(parents=True, exist_ok=True)
        print(out_dir)
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            try:
                zip_ref.extractall(out_dir)
            except:
                print(zip_path)
                pass
        # After extraction, unzip any zip files inside the extracted contents
        unzip_recursively(out_dir)


if __name__ == '__main__':
    current_dir = Path(__file__).parent
    unzip_recursively(current_dir / '../assignments/day4')