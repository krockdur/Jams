


-- guerrier.lua

local GameObject = {}
GameObject.__index = GameObject

function GameObject.new(nom, pointsDeVie, force)
    local nouvelObjet = {}
    setmetatable(nouvelObjet, GameObject)
    
    GameObject.nom = nom
    GameObject.pv = pointsDeVie
    GameObject.force = force 
    

    GameObject.niveau = 1 
    
    return nouvelObjet
end


function GameObject:attaquer(cible)
    print(self.nom .. " attaque " .. cible.nom .. " !")
    cible.pv = cible.pv - 10
    print(cible.nom .. " a maintenant " .. cible.pv .. " PV.")
end


return GameObject



