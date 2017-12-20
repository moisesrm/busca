$capacidade = 400
$melhorAproveitamento = 0
#item ,peso , valor
$items = [
    ["map",9,150],
    ["compass",13,35],
    ["water",153,200], 
    ["sandwich",50,160 ],
    ["glucose",15,60 ],
    ["tin",68,45],
    ["banana",27,60],
    ["apple",39,40 ],
    ["cheese",23,30],
    ["beer",52,10],
    ["suntan cream",11,70],
    ["camera",32,30],
    ["T-shirt",24,15],
    ["trousers",48,10],
    ["umbrella",73,40],
    ["waterproof trousers",42,70],
    ["waterproof overclothes",43,75],
    ["note-case",22,80],
    ["sunglasses",7,20],
    ["towel",18,12],
    ["socks",4,50],
    ["book",30,10]
]

Node = Struct.new(:pai, :left, :right, :peso, :valor, :item)
Dado = Struct.new(:pesoTotal, :valorTotal)
pai = Node.new
pai.peso = $items[0][1]
pai.valor = $items[0][2]
pai.item = 0
pai.left = Dado.new($items[0][1],$items[0][2])
pai.right = Dado.new($items[0][1],$items[0][2])

def percorreArvore(i,pai)
    filho = Node.new
    filho.pai = pai
    filho.peso = $items[i][1]
    filho.valor = $items[i][2]

    if (filho.peso + filho.pai.right.pesoTotal) > $capacidade
        return
    elsif (filho.valor + filho.pai.right.valorTotal) < $melhorAproveitamento
        return
    else
        pesoTotal = filho.peso + filho.pai.right.pesoTotal
        valorTotal = filho.valor + filho.pai.right.valorTotal

        filho.left = Dado.new(pesoTotal,valorTotal)
        filho.right = Dado.new(pesoTotal,valorTotal)
        $melhorAproveitamento = valorTotal
        print "Adicionou: "
        print $items[i][0]
        print " - "
        print valorTotal
        print " - "
        print pesoTotal
        print "\n"
        percorreArvore(i+1,filho)
    end

    if (filho.pai.left.pesoTotal) > $capacidade
        return
    elsif (filho.pai.left.valorTotal) < $melhorAproveitamento 
        return
    else
        pesoTotal = filho.pai.right.pesoTotal
        valorTotal = filho.pai.right.valorTotal
        filho.left = Dado.new(pesoTotal,valorTotal)
        $melhorAproveitamento = valorTotal
        print $items[i][0]
        print "Removeu: "
        print $items[i][0]
        print " - "
        print valorTotal
        print " - "
        print pesoTotal
        print "\n"
        percorreArvore(i+1,filho)
    end
end

percorreArvore(1,pai)
print "\n"
print $melhorAproveitamento
print "\n"