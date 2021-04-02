import time
from locust import HttpUser, task, between

class ContainerShowdown(HttpUser):
    wait_time = between(1, 2.5)

    @task
    def home(self):
        self.client.get("/")

    @task
    def privacy(self):
        self.client.get("/Home/Privacy")