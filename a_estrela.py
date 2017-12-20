from collections import defaultdict
from math import sqrt
import heapq

NODO_FIM = 38

class Grafo:

	def __init__(self, arquivo=None):
		self.grafo = defaultdict(list)
		self.vertices = {}
		if arquivo is None:
			return
		with open(arquivo) as arquivo:
			comecou_conexoes = False
			pontos = defaultdict(list)
			conexoes = defaultdict(list)
			# captura de arestas e vertices
			for linha in arquivo:
				lin = linha.split(' ')
				if not comecou_conexoes:
					#se encontrou a palavra vertice começa a conexao
					if 'vertice' not in lin[0]:
						pontos[int(lin[0])] = (float(lin[1]), float(lin[2]))
					else:
						comecou_conexoes = True
						continue
				else:
					lin = linha.split('\t')
					conexoes[int(lin[0])].append(int(lin[1].replace('\n','')))

			# calcula distancia e armazena no grafo
			for orig, dorig in conexoes.items():
				for dest in dorig:
					#calculo da distancia
					custo = sqrt( ((pontos[orig][0]-pontos[dest][0])**2) + ((pontos[dest][1]-pontos[orig][1])**2) )
					self.addAresta(orig,dest,custo)

	def addAresta(self, orig, dest, custo):
		self.grafo[orig].append((dest, custo))
		self.vertices[orig] = orig
		self.vertices[dest] = dest

	def getGrafo(self):
		return self.grafo

	def getVertices(self):
		return self.vertices

	def aEstrela(self):	
		listaFechada = [1]
		indice = 1
		for quantidade in self.grafo:
			achou = 0
			for vizinhos in range(0,len(self.grafo[indice])):
				for nodo in self.grafo[indice]:
					if nodo[0] == NODO_FIM:
						print("Final")
						return listaFechada						
				menorNumero = min(self.grafo[indice], key=lambda x: x[1])[:]
				nodo = menorNumero[0]
				if nodo not in listaFechada:
					listaFechada.append(nodo)
					achou = 1
					indice = nodo
					break
				nodoVisitado = self.grafo[indice].index(min(self.grafo[indice], key=lambda x: x[1])[:])
				del self.grafo[indice][nodoVisitado]
			if achou == 0:
				return "Não achou o fim"

print("===============================")
g = Grafo("dj38.tsp.txt")
print(g.aEstrela())
