from krita import *
app = Krita.instance()
doc = app.activeDocument()
doc.setBatchmode(True)
#current = doc.activeNode()
#print(doc.topLevelNodes())


#    #    #    #    #    #    #ladujemy kolory
for i in doc.topLevelNodes():
    if i.name()[0:len("ScriptGroupColours")] == "ScriptGroupColours":
        grupakolorkow = i
        #nodedopracy.append(i)
        #print(i.name() , " nodedopracy")
    
    if i.name()[0:len("ScriptGroupMask")] == "ScriptGroupMask":
        grupamasek = i
        #nodedopracy.append(i)
        #print(i.name() , " nodedopracy")
        
    if i.name()[0:len("EmptyLayer")] == "EmptyLayer":
        pustawarstwadoklonowania = i
        #nodedopracy.append(i)
        #print(i.name() , " nodedopracy")
        
for i in grupakolorkow.childNodes():
    print("Dostepne Kolory: ",i.name())
    #for j in i.childNodes():
    #   print(j.name())
#    #    #    #    #    #    #ladujemy kolory


#    #    #    #    #    #    #ladujemy maski
for i in grupamasek.childNodes():
    print("Dostepne Maski: ",i.name())
    #for j in i.childNodes():
    #   print(j.name())
   
#    #    #    #    #    #    #ladujemy maski 


ilosckombinacji = 1
for i in range(len(grupamasek.childNodes())):
    ilosckombinacji *= len(grupakolorkow.childNodes())
    print(ilosckombinacji)

nowapustawarstwa = pustawarstwadoklonowania.duplicate()
nowapustawarstwa.setName("nowawarstwa")
nowapustawarstwa.setVisible(True)
doc.rootNode().addChildNode(nowapustawarstwa,None)

for i in range(ilosckombinacji):
    j = i
    tablicakolorkow = []
    for k in range(len(grupamasek.childNodes())):
        #print(j%len(grupakolorkow.childNodes()), end=" ")
        tablicakolorkow.append(grupakolorkow.childNodes()[j%len(grupakolorkow.childNodes())])
        j=j//len(grupakolorkow.childNodes())  
        
        
        
        
        
        
    
    savename = ""
    for i in range(len(tablicakolorkow)):
        print("----------------------------------")
        print(tablicakolorkow[i].name(),grupamasek.childNodes()[i].name())
        savename += tablicakolorkow[i].name() 
        savename += " "
        
        nowawarstwa = tablicakolorkow[i].duplicate()
        nowawarstwa.setVisible(True)
        print(nowawarstwa)
        print(nowawarstwa.name()+" tymczasowa kopia" , i)
        nowawarstwa.setName(nowawarstwa.name()+" tymczasowa kopia " + str(i))
        print(doc.rootNode().addChildNode(nowawarstwa,None))
        
        nowawarstwa2 = grupamasek.childNodes()[i].duplicate()
        nowawarstwa2.setVisible(True)
        print(nowawarstwa2)
        print(nowawarstwa2.name()+" tymczasowa kopia")
        nowawarstwa2.setName(grupamasek.childNodes()[i].name()+" tymczasowa kopia")
        #print(doc.rootNode().addChildNode(nowawarstwa2,None))
        selekcja = nowawarstwa2.selection()
        selekcja.invert()
        selekcja.cut(nowawarstwa)
        #selekcja.selectAll(nowawarstwa,255)
        #nowawarstwa2.selection().selectAll(nowapustawarstwa,255)
        #selekcja.paste(nowapustawarstwa,,0)
        nowawarstwa.setVisible(True)
        nowawarstwa2.setVisible(False)
        nowawarstwa.mergeDown()
    doc.saveAs("/home/peepeepoopoo/mytdtest/Sprites/Tilesets/Myset/" + savename+".png")
    print(" ")
    #print(doc.rootNode().childNodes())
    #for i in doc.rootNode().childNodes():
        #print (i.name())
#    print(pustawarstwadoklonowania.uniqueId(), pustawarstwadoklonowania.name())
#    print(nowapustawarstwa.uniqueId(), nowapustawarstwa.name())
    
    
    