# Serves the built web app and the API from one origin. Lives outside api/ so the cache keys stay the same.
import sys
sys.path.insert(0, '/app/api')
from fastapi.staticfiles import StaticFiles
from app import app
app.mount('/', StaticFiles(directory='/app/web/dist', html=True), name='web')
