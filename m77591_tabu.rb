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

caminho = Array.new
tabu = Array.new
interacao = 3
caminho << $items[0][0]
$capacidade = $capacidade - $items[0][1]
novoaproveitamento = $items[0]
ultimoAproveitamento = $items[0]

for indice in 1 .. $items.length
    itensRestantes = $items.length
    novoaproveitamento = $items[indice]
    for indice2 in indice .. itensRestantes
        if $items[indice2] == nil
            next
        end 
        print("#{novoaproveitamento}\n")
        if ($items[indice2][1] < novoaproveitamento[1]) && ($items[indice2][2] > novoaproveitamento[2])
            novoaproveitamento = $items[indice2]
            indiceNovoAproveitamento = indice2
        end
    end    
    
    if((novoaproveitamento[2] > ultimoAproveitamento[2]) && ($capacidade > 0))
        $capacidade = $capacidade - novoaproveitamento[1]
        caminho << novoaproveitamento[0]
        $items.delete(indiceNovoAproveitamento)
    else
        if(interacao != 0)
            interacao -= 1
            tabu << novoaproveitamento[0]
        else
            print "caminho: "
            print caminho
            print "\n"
            print "Tabu: "
            print tabu
            print "\n"
            exit
        end
    end
    ultimoAproveitamento = novoaproveitamento
end

print caminho
print "\n"
print tabu
