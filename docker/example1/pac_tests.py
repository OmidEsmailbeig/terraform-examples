from tf2 import Tf2, Terraform, TerraformPlanLoader

tf2 = Tf2(Terraform(TerraformPlanLoader()))

@tf2.test('resources.docker_container.nginx')
def test_nginx_image_without_latest_tag(self):
    for instance in self.instances.values():
        # Don't let nginx images use latest tag
        assert instance.values.image.endswith(':latest') is False
       
tf2.run()
