c.Spawner.default_url = '/lab'
c.Spawner.notebook_dir = '~/notebook'
c.Authenticator.admin_users = {'jupyterhub_admin'}

with open("/tmp/users.txt" ,"r") as f:
    users = [l.strip().replace("\n", "") for l in f.readlines()]

#c.Authenticator.allowed_users = {'jupyterhub_user1', 'jupyterhub_user2'}
c.Authenticator.allowed_users = set(users)
