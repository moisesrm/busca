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

melhor = 0
atual = 0
melhorAlterou = 0
caminho = [$items[melhor][0]]
fim = 0
while fim != 1 
    for proximo in 1..$items.length
        indiceVizinho = atual+proximo
        vizinho = $items[indiceVizinho]
        if vizinho == nil
            fim = 1
            break
        end
        
        if (vizinho[2] > $items[atual][2]) && (rand(0..10) < (Math.exp(vizinho[1]-$items[atual][1]))/$capacidade)
            atual = indiceVizinho
            $capacidade = $capacidade-vizinho[1]
        end
        if $items[atual][2] > $items[melhor][2]
            melhor = atual
            melhorAlterou = 8
            caminho << $items[melhor][0]
            break
        end
    end
    if $capacidade < 0 
        fim = 1
    end
    if melhorAlterou > 0
        melhorAlterou = melhorAlterou-1
    else
        fim = 1
    end
    if proximo == nil
        fim = 1
    end
end
print caminho
