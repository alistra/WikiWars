from twisted.web import server, resource
from twisted.internet import reactor
import json
import random
article_pairs = [
	("Fenic", "http://starwars.wikia.com/wiki/Fenic"),
	("Almar System", "http://starwars.wikia.com/wiki/Almar_system"),
	("105th Stormtrooper Platoon", "http://starwars.wikia.com/wiki/105th_Stormtrooper_Platoon"),
	("Jariad Korsin","http://starwars.wikia.com/wiki/Jariad_Korsin"),
	("CryoBan cell", "http://starwars.wikia.com/wiki/CryoBan_cell"),
	("Coruscant", "http://starwars.wikia.com/wiki/Coruscant"),
	("Nerf Herder", "http://starwars.wikia.com/wiki/Nerf_herder"),
	("Darth Caedus","http://starwars.wikia.com/wiki/Darth_Caedus"),
	("Traladon milk", "http://starwars.wikia.com/wiki/Traladon_milk"),
	("Luke Skywalker", "http://starwars.wikia.com/wiki/Luke_Skywalker")
	]

article_pairs_easy = [
    ("Han Solo", "http://starwars.wikia.com/wiki/Han_Solo"),
	("Chewbacca","http://starwars.wikia.com/wiki/Chewbacca"),
	("Clone Wars","http://starwars.wikia.com/wiki/Clone_Wars"),
	("Qui Gon Jinn","http://starwars.wikia.com/wiki/Qui-Gon_Jinn"),
	("Obi-Wan Kenobi","http://starwars.wikia.com/wiki/Obi-Wan_Kenobi")
    ]

article_pairs = article_pairs_easy
class Simple(resource.Resource):
    isLeaf = True
    def render_GET(self, request):
		request.setHeader("content-type", "application/json")
		article1, article2 = random.sample(article_pairs, 2)
		a1 = {"name": article1[0], "url":article1[1]}
		a2 = {"name": article2[0], "url":article2[1]}
		j = json.dumps({"article1":a1, "article2":a2})
		return j

site = server.Site(Simple())
reactor.listenTCP(8080, site)
reactor.run()

