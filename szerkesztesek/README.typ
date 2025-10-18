#import "@preview/cetz:0.3.2"

#set page(margin: (
  top: 2cm,
  bottom: 1.5cm,
  x: 1.5cm,
))


== Segédlet
=== Thálesz-tétel
A Thálesz-tétel kimondja, hogy ha egy $C$ pont a kör ívén van (de nem az átmérőn), akkor az átmérő $C$-ből derékszög alatt látszik. A Thálesz-tétel megfordítása pedig azt mondja ki, hogy ha egy háromszög derékszögű, akkor három csúcsa olyan körön van, melynek átmérője az átfogó.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.angle: *
    
    set-style(stroke-width: 1pt)

    circle((0, 0), radius: 3, name: "k")
    circle((0, 0), radius: 0.07, fill: black, name: "O")
    content("O", $ O $, anchor: "north-east", padding: .1)
    circle((3, 0), radius: 0.07, fill: black, name: "B")
    content("B", $ B $, anchor: "north-east", padding: .1)
    circle((-3, 0), radius: 0.07, fill: black, name: "A")
    content("A", $ A $, anchor: "north-west", padding: .1)
    circle((1.5, 2.598), radius: 0.07, fill: black, name: "C")
    content("C", $ C $, anchor: "south-west", padding: .1)
    line("A", "B", name: "c")
    line("A", "C", name: "b")
    line("B", "C", name: "a")
    right-angle("b.end", "b.start", "a.start", radius: 15%)
  })
]
=== Hasonló háromszögek
Két háromszög egymáshoz hasonló ($A B C triangle.stroked.t tilde A' B' C' triangle.stroked.t$), ha bármelyik teljesül az alábbiakból:

- két szögük egyenlő (tehát ezáltal a harmadik is).

- két oldal aránya és a nagyobbikkal szemközti szögük egyenlő.

- két oldal aránya és az általuk bezárt szögeik egyenlők.

- három oldal aránya páronként egyenlő.

Ezek az állítások egymásból következnek, tehát minden hasonló háromszög párra igaz, hogy: $ frac(A B, A' B') = frac(B C, B' C') = frac(C A, C' A') $

#cetz.canvas(length: 27pt,{
  import cetz.draw: *
  import cetz.angle: *
  
  set-style(stroke-width: 1pt)
  content((8,6), 
    $A B C triangle.stroked.t tilde A' B' C' triangle.stroked.t
    tilde D B A triangle.stroked.t
    tilde D A C triangle.stroked.t
    tilde A' F_1 F_2 triangle.stroked.t
    $
  )

  circle((0, 0), radius: 0.07, fill: black, name: "A")
  circle((6, 0), radius: 0.07, fill: black, name: "B")
  circle((0, 8), radius: 0.07, fill: black, name: "C")
  content("A", $ A $, anchor: "north-east", padding: .1)
  content("B", $ B $, anchor: "north-west", padding: .1)
  content("C", $ C $, anchor: "south-east", padding: .1)
  line("A", "B", name: "c")
  line("A", "C", name: "b")
  line("B", "C", name: "a")

  right-angle("b.start", "b.end", "a.start", radius: 8%)

  circle((3.84, 2.88), radius: 0.07, fill: black, name: "D")
  content("D", $ D $, anchor: "south-west", padding: .1)
  line((0,0), "D", stroke: (dash: "dashed"))
  right-angle("D", "A", "B", radius: 15%)

  angle("C", "A", "B", radius: 20%, name: "alpha", label: $ gamma $, label-radius: 75%)
  angle("B", "C", "A", radius: 20%, name: "beta", label: $ beta $, label-radius: 70%)
  angle("A", "B", "D", radius: 25%, name: "alpha'", label: $ gamma $, label-radius: 75%)
  angle("A", "D", "C", radius: 30%, name: "beta'", label: $ beta $, label-radius: 75%)

  circle((8, 0), radius: 0.07, fill: black, name: "A'")
  circle((14, 0), radius: 0.07, fill: black, name: "C'")
  circle((8, 4), radius: 0.07, fill: black, name: "B'")
  content("A'", $ A' $, anchor: "north-east", padding: .1)
  content("B'", $ B' $, anchor: "south-east", padding: .1)
  content("C'", $ C' $, anchor: "north-west", padding: .1)
  line("A'", "B'", name: "c'")
  line("A'", "C'", name: "b'")
  line("B'", "C'", name: "a'")

  right-angle("A'", "B'", "C'", radius: 15%)
  angle("B'", "A'", "C'", radius: 25%, label: $ beta $, label-radius: 75%)
  angle("C'", "B'", "A'", radius: 25%, label: $ gamma $, label-radius: 75%)

  circle((8, 2), radius: 0.07, fill: black, name: "F_1")
  content("F_1", $F_1$, anchor: "east", padding: 0.1)
  circle((11, 0), radius: 0.07, fill: black, name: "F_2")
  content("F_2", $F_2$, anchor: "north", padding: 0.2)

  line("F_1", "F_2", stroke: (dash: "dashed"))
  angle("F_1", "A'", "F_2", radius: 35%, label: $ beta $, label-radius: 75%)
  angle("F_2", "F_1", "A'", radius: 35%, label: $ gamma $, label-radius: 75%)
  
})

Egy derékszögű háromszög átfogóhoz tartozó magassága két hasonló háromszögre bontja a háromszöget,
 melyek mindegyike hasonló az eredeti háromszöghöz is. 
($beta + gamma = 90 degree arrow.r.double 180 degree - 90 degree - beta = gamma$)


#pagebreak()

== Mohr-Mascheroni szerkesztések <mohr-mascheroni-szerkesztések>

Euklideszi szerkesztésnek hívunk mindent, amit gimiben tanultatok szerkesztés néven. A használható lépések:

//#align(center, image("./media/alaplepesek.png", width: 80%)) 

#cetz.canvas({
  import cetz.draw: *
  import cetz.decorations: *
  
  set-style(stroke-width: 1pt)

  circle((-1.5, 2.6), radius: 0.07, name: "A", fill: black)
  circle((-.5, 2.8), radius: 0.07, name: "B", fill: black)

  line((-2,2.5), (0.5, 3), stroke: (dash: "dashed"), name: "one")
  content((-2,3.8),"one", $ 1. $)

  line((0.7, 4), (0.7, 2))

  circle((2.5, 3), radius: 0.07, name: "P", fill: black)
  circle((2.5, 3), radius: 1, name: "C", stroke: (dash: "dashed"))

  circle((3.4, 3.4), radius: 0.07, name: "Q", fill: black)
  line((2.5, 3), (3.4, 3.4))
  content((-0.2,3.8), "C", $ 2. $)
  brace("P", "Q")

  line((3.8, 4), (3.8, 2))

  line((4.5, 3.5), (7, 2.2))
  line((4.5, 2.3), (7, 3.2))
  circle((5.8637, 2.79), radius: 0.07, name: "R", fill: black)
  content((2.5,3.8), "R", $ 3. $)


  line((7.2, 4), (7.2, 2))

  circle((9.2, 3), radius: 1, name: "D")
  line((7.9, 3.7), (10.5, 2.7))
  circle((8.35, 3.5269), radius: 0.07, name: "S", fill: black)
  content((6,3.8), "D", $ 4. $)


  line((10.7, 4), (10.7, 2))

  circle((12.5, 3), radius: 1, name: "E")
  circle((13.5, 3), radius: 1, name: "F")
  circle((13, 3.866), radius: 0.07, name: "T", fill: black)
  content((9.7,3.8), "E", $ 5. $)


  line((14.7, 4), (14.7, 2))

  circle((16, 3.5), radius: 0.07, name: "U", fill: black)
  circle((15.2, 2.3), radius: 0.07, name: "V", fill: black)
  line("U", "V", stroke: (dash: "dashed"))
  content((17.9,3.8), "E", $ 6. $)
  brace("U", "V")
  
})

+ A vonalzót két adott ponton átmenő egyenes megrajzolására használhatjuk.
+ A körzővel adott pont körül adott hosszú sugárral kört rajzolhatunk.
+ Két egyenes metszéspontját megjelölhetjük.
+ Egyenes és kör metszéspontját megjelölhetjük.
+ Két kör metszéspontját megjelölhetjük.
+ Két pont távolságát körzőnyílásba vehetjük.

Amit ezeknek a véges számú ismétlésével meg lehet szerkeszteni az pacek. Ezekből épül fel akár egy merőleges megszerkesztése is, de az önmagában nem alapművelet. Ugyanakkor nem minden megszerkeszthető (Pl.: szabályos hétszög, szögharmadolás).

#emph[Egy bemelegítő szerkesztés]: derékszögű háromszög melynek tudjuk két befogójának hosszát. 

#block(
  inset: 8pt,
  stroke: (left: 2pt),
)[
  #strong[Kitektintés] 

  Az előbb említett feladatoknak a #link("https://www.math.u-szeged.hu/~twaldha/tanitas/regi/galois_2015osz/szerkeszthetoseg_oldal.pdf")[megszerkeszthetetlenségét] algebrailag lehet bizonyítani a #link(
    "https://en.wikipedia.org/wiki/Constructible_number",
  )[megszerkeszthető számok] segítségével. Ezek olyan számok, amik egész számokból az összeadás, kivonás, szorzás, osztás, gyökvonás műveletek segítségével előállíthatóak. 

  Ezek a számok pl. távolságok vagy arányok, amiket meg lehet szerkeszteni (szintén bizonyítható, hogy ez oda-vissza működik), és a fenti feladatok megoldásához olyan számot kéne előállítani, ami nem esik ebbe a számhalmazba.
]



=== Körző nélkül <körző-nélkül>
A hat alaplépés közül néhány triviális vonalzó nélkül is, a maradék viszont konkrétan lehetetlennek tűnik.

#block(

  inset: 8pt,

  radius: 4pt,
)[
    - A vonalzót két adott ponton átmenő egyenes megrajzolására használhatjuk.
    - Két egyenes metszéspontját megjelölhetjük.
    - Egyenes és kör metszéspontját megjelölhetjük.
]

Ahhoz, hogy ekvivalens legyen a csak körzős szerkesztés az euklidészivel, ahhoz át kell hidalni a hiányzó lépéseket. Viszont #strong[csak a pontokat kell tudnunk megszerkeszteni];, maga a kör, vagy az egyenes megjelenése nem feltétlen szükséges.

Először nézzük meg, hogy mi az, ami egyáltalán eszünkbe jut, hogy az egyik eszköz nélkül meg tudjuk szerkeszteni, #emph[egyelőre bármilyen mágia nélkül];.

#block(inset: 8pt)[
  - tengelyes tükrözés
  - szabályos háromszög/hatszög
  - egyenlőszárú háromszög
  - szakasz duplázás
]

Körzővel köröket tudunk szerkeszteni és elmetszeni, tehát felmerül az ötlet: #strong[#emph[\*valahogy\*] alakítsuk át az egyeneseinket körökké], és akkor a hiányzó lépéseket meg tudjuk csinálni. Ehhez szükségünk lenne egy új, #strong[nem egyenestartó] geometriai transzformációra.

#pagebreak()

=== Geometriai transzformációk <geometriai-transzformációk>
Vannak a függvények, pl.: $f(x) = x^2$, ahol van egy alaphalmazunk ($RR$), illetve egy képhalmazunk (szintén $RR$), és maga a függvény azt a szabályt határozza meg, ami alapján ezek elemeit hozzárendeljük egymáshoz. Geometriai transzformációknál ugyanez a helyzet, csak itt az alaphalmaz és a képhalmaz is a sík pontjai. Egyértelmű függvénynek hívtuk azokat, ahol az alaphalmaz minden egyes eleméhez legfeljebb egy elemet tudunk hozzárendelni a képhalmazból, és ezt a tulajdonságot a geometriai transzformációknál is szeretnénk megőrizni.



//#align(center,image("./media/Injective-Function-5.png", width: 80%))

#quote(block: true)[
  #strong[Opcionális] Próbáljunk meg egyértelmű hozzárendelést találni az alábbi ponthalmazok között! 
  - szakasz és hosszabb szakasz 
  - szakasz és körív 
  - szakasz és végpontok nélküli szakasz 
  - szakasz és egyenes 
  - körlap és sík 
  - szakasz és sík
]

Az általunk ismert geometriai transzformációk(forgatás, eltolás, tükrözés, hasonlóság), általában mind szögtartóak, egyenestartóak és távolságtartóak (kivéve a hasonlóság).

== Inverzió <inverzió>
Nekünk olyan transzformáció kell, ami nem csak hogy #strong[nem] egyenestartó, de az egyenesek képe kör! Hol tapasztalunk hasonló jelenséget a valóságban? (Görbe tükröknél). Lehetséges körre tükrözni? Ugyanúgy ahogy a tengelyes tükrözésnél létezik egy tükör tengely, a körre tükrözésnél, vagy más néven inverziónál van egy alapkör.

#cetz.canvas({
  import cetz.draw: *
  
  set-style(stroke-width: 1pt)
  line((0, -1), (0, 1), name: "line")
  circle((-1, 0.5), radius: 0.05, fill: black, name: "A")
  circle((1, 0.5), radius: 0.05, fill: black, name: "A'")
  circle((0, 0.5), radius: 0.05, fill: black, name: "T")
  content("A", $ A $, anchor: "north-east", padding: .1)
  content("A'", $ A' $, anchor: "north-west", padding: .1)
  content("T", $ T $, anchor: "north-east", padding: .1)
  line((-1, 0.5), (1, 0.5), stroke: (dash: "dashed"))

  content((0, -2), $A T  = T A'$ + " és az egyenes által meghatározott\nfélsíkok pontjai helyet cserélnek.", anchor: "north", padding: .1)

  line((4, -3), (4, 2), stroke: (dash: "dashed"))


  circle((7, 0), radius: 1.3, name: "k")
  circle((7, 0), radius: 0.05, fill: black, name: "B")
  circle((7.5, 0), radius: 0.05, fill: black, name: "B'")
  circle((10.38, 0), radius: 0.05, fill: black, name: "C")
  content("B", $ O $, anchor: "north-east", padding: .1)
  content("B'", $ B' $, anchor: "north-west", padding: .1)
  content("C", $ B $, anchor: "north-east", padding: .1)
  line((7, 0), (10.38, 0), stroke: (dash: "dashed"))

  content((8.5, -2), $O P dot O P' = r^2$ + " és a körön belüli, illetve\n az azon kívüli pontok helyet cserélnek.", anchor: "north", padding: .1)
})

Oké, mostmár csak meg kéne szerkeszteni. Kezdetben először nyugodtan kereshetünk olyan megoldást, amihez szükséges a vonalzó. A definíció átrendezéséből adódik, hogy:

$
O P dot O P' &= r^2 &\/ r; O P'\
frac(O P, r) &= frac(r, O P')
$


$

$

Tehát van itt nekünk egy arányosságunk, amit nagyon szépen fel tudunk használni például hasonló háromszögek segítségével. Azt is látjuk, hogy a két leendő hasonló háromszögünk osztozik egy $r$ oldalon, ami az alapkör sugara lesz.
//#align(center, image("./media/inversion_def.png", width: 80%))

Ha például $O P$ átmérőjű kört húzúnk, akkor a két kör metszetéből (nevezzük el $N$-nek) a Thálesz-tétel miatt derékszög alatt látszik az átmérő. Ha tehát merőlegest húzúnk az $O P$ szakaszra az $N$ pontban, akkor ki tudunk erőszakolni egy másik derékszögű háromszöget, aminek az egyik befogója az $r$ oldal lesz. Rövid szögszámolás alapján ki is jön, hogy ezek a háromszögek tényleg hasonlóak tehát az inverz pontot megkaptuk az $O P N triangle.stroked.t$ áttfogójához tartozó magasságának talppontjaként.

#align(center)[
#cetz.canvas({
  import cetz.draw: *
  import cetz.angle: *
  
  set-style(stroke-width: 1pt)
  grid((-3.5,-3.5), (8,3.5), help-lines: true)

  circle((0, 0), radius: 2, name: "k")
  circle((0, 0), radius: 0.05, fill: black, name: "O")
  content("O", $ O $, anchor: "north-east", padding: .1)

  circle((3, 0), radius: 3)
  circle((3, 0), radius: 0.05, fill: black)
  circle((6, 0), radius: 0.05, fill: black, name: "P")
  content("P", $ P $, anchor: "north-east", padding: .1)

  line((0,0),(6,0))
  circle((0.66666667, 1.885618), radius: 0.05, fill: black, name: "N")
  content("N", $ N $, anchor: "south", padding: .2)

  circle((0.66666667, 0), radius: 0.05, fill: black, name: "P'")
  content("P'", $ P' $, anchor: "north-west", padding: .1)
  right-angle("P'", "O", "N", radius: 45%)
  right-angle("N", "O", "P", radius: 20%)
  

  line((0.66666667, 1.885618), (0.66666667, -1.885618))
  circle((0.66666667, -1.885618), radius: 0.05, fill: black, name: "N'")
  content("N'", $ N' $, anchor: "north", padding: .2)

 
  line((6, 0), (angle: 90deg, radius: 2.1213), stroke: (dash: "dashed"))

  line((0,0), (0.66666667, 1.885618), stroke: (dash: "dashed"))

  
})
]
Ehhez azonban mindenféleképpen szükségünk van körzőre, hogy megszerkesszük. A szögszámolásból azonban kijön, hogy majdnem mindegy, hogy az alapkör körívén melyik pontot választjuk meg a két háromszög harmadik csúcsaként, azok mindenképp hasonlóak lesznek az inverzió definíciója miatt.

Válasszunk tehát olyan háromszögeket amelyeket könnyen meg tudunk szerkeszteni csak körzővel is. Példáúl egy egyenlő szárú háromszög tökéletesen megfelel erre a célra.


#align(center)[
#cetz.canvas({
  import cetz.draw: *
  grid((-3.5,-3), (8,3), help-lines: true)
  scale(2.5)

  circle((0,0), radius: 1)
  circle((0,0), radius: .025, fill: black, name: "O")
  content("O", $ O $, anchor: "north-east", padding: .1)
  circle((2,0), radius: .025, fill: black, name: "P")
  content("P", $ P $, anchor: "north-east", padding: .1)
  circle((0.25,0.9682), radius: .025, fill: black, name: "A")
  content("A", $ A $, anchor: "north-east", padding: .1)
  circle((0.5,0), radius: .025, fill: black, name: "P'")
  content("P'", $ P' $, anchor: "north-east", padding: .1)

  arc((0.2,0), start: 0deg, delta: 75.5225deg, radius: 0.2,
    mode: "PIE",fill: color.mix((gray, 80%), white))
  arc((0.175, 0.66667), start: 255.5225deg, delta: 28.955deg, radius: 0.3,
    mode: "PIE",fill: color.mix((gray, 30%), white))
  arc((0.2,0.7746), start: 255.5225deg, delta: 75.5225deg, radius: 0.2, 
    mode: "PIE",fill: color.mix((gray, 80%), white))
  arc((1.7375, 0.1452), start: 151.045deg, stop: 180deg, radius: 0.3,
    mode: "PIE",fill: color.mix((gray, 30%), white))

  line((0.25,0.68), (0.25, 0.62))
  line((1.74, 0.06715),(1.6611139572069, 0.075))
  

  line((0,0),(2,0))
  line((2,0),(0.25,0.9682))
  line((0,0),(0.25,0.9682))
  line((0.5,0),(0.25,0.9682))
})
]


#quote(
  block: true,
)[
  Meggondolandó az az eset, mikor $𝑂 𝑃 lt.eq 𝑟/2$, hisz ekkor 𝑃-ből 𝑂𝑃 távolsággal kört rajzolva maximum egy metszéspontunk lesz. Az ilyen esetek megoldásának a kulcsa az, hogy körző segítségével az 𝑂𝑃 távolságot a 𝑃 ponton túl annyiszor kétszerezzük meg, hogy nagyobb legyen, mint $r/2$, s így adódik már két metszéspont, és a fent leírtakat tudjuk alkalmazni. Ezután az inverz távolságát is duplázzuk, hogy megkapjuk a pontunkat. 
]

Egy kis összefoglalás a triviális észrevételekről: 
- az inverzió kétszer alkalmazva identitás, visszakapjuk az eredeti alakzatokat 
- az alapkörön belüli pontokat, az alapkörön kívülre képzi és vica versa 
- problémás az alapkör középpontjának inverze.#footnote("Ezt vagy ignoráljuk, és elfogadjuk, hogy az inverziót nem definiáljuk erre pontra és egy részleges függvénnyel dolgozunk tovább (mint az" + $f (x) = 1 / x$ + ") , vagy létrehozzzuk " + link("https://en.wikipedia.org/wiki/Point_at_infinity",)[A Végtelenben Lévő pontot] + ", és ez a két pont egymás inverze lesz.")

== Inverzió tulajdonságai <inverzió-tulajdonságai>

Pontok inverz képét már meg tudjuk határozni, sőt szerkeszteni is. Ahogy a tengelyes tükrözésnél is, itt is vannak fix pontok és invariáns alakzatok:

- fix pontok: a kör köríve, tehát ennek képe önmaga lesz
- invariáns alakzatok: az alapkör középpontján áthaladó egyenes. Ennek is önmaga lesz a képe.

=== Egyenes inverze

Én viszont azt ígértem, hogy olyan transzformációt fogunk tanulni, ami nem egyenestartó, mégis, az alapkör középpontján áthaladó egyenes képe önmaga lesz. Nézzünk meg egy origón át-nem-haladó egyenest is. Néhány pontjának az inverz képének megszerkesztése után azt látjuk, hogy valami kör szerű dolgot kapunk, azonban ez nem elég nekünk, ahogy az sem, hogy én azt mondtam. Bizonyítsuk is be, hogy tényleg kör lesz ennek az egyenesnek az inverze.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.angle: *
    
    set-style(stroke-width: 1pt)
    grid((-3.5,-3.5), (8,3.5), help-lines: true)

    circle((0, 0), radius: 3, name: "k")
    circle((0, 0), radius: 0.05, fill: black, name: "O")
    content("O", $ O $, anchor: "north-east", padding: .1)

    line((6, 4), (6, -4), name: "e")
    circle((rel: (0,7)), radius: 0.05, fill: black, name: "P1")    
    content("P1", $ P_1 $, anchor: "south-west", padding: .1)
    circle((rel: (0,-1.5)), radius: 0.05, fill: black, name: "P2")
    content("P2", $ P_2 $, anchor: "north-west", padding: .1)
    circle((6, 0), radius: 0.05, fill: black, name: "P3")
    content("P3", $ P_3 $, anchor: "north-west", padding: .1)
    circle((rel: (0,-3)), radius: 0.05, fill: black, name: "P4")
    content("P4", $ P_4 $, anchor: "north-west", padding: .1)

    circle((1.5, 0), radius: 0.05, fill: black, name: "P3'")

    circle((0.75, 0), radius: 0.02, fill: black, name: "inv_circ_center")
    circle((), radius: 0.75, stroke: (dash: "dashed"), name: "inv_circ")

    line("O", "P1", stroke: (dash: "dashed"), name: "1")
    line("O", "P2", stroke: (dash: "dashed"), name: "2")
    line("O", "P3", stroke: (dash: "dashed"), name: "3")
    line("O", "P4", stroke: (dash: "dashed"), name: "4")


    intersections("i", "inv_circ", "1", "2", "3", "4")
    for-each-anchor("i", (name) => {
      circle("i." + name, radius: .05, fill:black, name: "P'_"+name)
    })
    content("i.1", $P'_1$, anchor: "south", padding: 0.35)
    content("i.1", $P'_2$, anchor: "west", padding: 0.25)
    content("i.2", $P'_3$, anchor: "north-west", padding: 0.1)
    content("i.4", $P'_4$, anchor: "north", padding: 0.15)
  })
]

A bizonyítás hasonló lesz, mint az előző: hasonló háromszögek, és a Thálesz-tétel segítségével kell megmutatnunk, hogy az egyenes bármely tetszőleges pontjának választása esetén is annak az inverz képe ugyanarra a körívre esik.

Invertáljunk két pontot: egy tetszőlegesen választott $P$ pontot, illetve $T$-t, ami az $O$-ból állított merőleges talppontja az $e$ egyenesen. Az inverzió tulajdonságaiból adódik, hogy $O P' T' triangle.stroked.t tilde.op O T P triangle.stroked.t$, és mivel $O T P angle$ derékszög, ezért $O P' T' angle$ is derékszög bármely szabadon választott $P$ pontra.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.angle: *
    
    set-style(stroke-width: 1pt)
    grid((-3,-3), (7,3), help-lines: true)

    circle((0, 0), radius: 3, name: "k")
    circle((0, 0), radius: 0.05, fill: black, name: "O")
    content("O", $ O_1 $, anchor: "north-east", padding: .1)

    line((4, 3.3), (4, -3.3), name: "e")
    circle((4, 2.5), radius: 0.05, fill: black, name: "P")    
    content("P", $ P $, anchor: "south-west", padding: .1)
    circle((4, 0), radius: 0.05, fill: black, name: "T")
    content("T", $ T $, anchor: "north-west", padding: .1)

    circle((1.125, 0), radius: 0.05, fill: black, name: "O_2")
    circle((), radius: 1.125, stroke: (dash: "dashed"), name: "inv_circ")
    line("O", "P", stroke: (dash: "dashed"), name: "a")
    content("O_2", $O_2$, anchor: "north", padding: .1)
    intersections("i", "inv_circ", "a")
    for-each-anchor("i", (name) => {
      circle("i." + name, radius: .05, fill:black, name: "P'")
      content("P'", $P'$, anchor: "south", padding: 0.2)
    })

    circle((2.25, 0), radius: 0.05, fill: black, name: "T'")
    content("T'", $ T' $, anchor: "north-west", padding: .1)

    line((-3.3, 0), (7.3,0), name: "x")
    line("T'", "P'", name: "P'T'")
    right-angle("P'", "O", "T'", radius: 20%)
    line("O", "P'", name: "OP'")
    right-angle("T", "O", "P", radius: 15%)
    angle("O", "T'", "P'")

  })
]

//#box(image("./media/Line_inversion_proof.png"))


Eddig a következőket tudjuk az egyenesek inverz képéről: 
- póluson átmenő egyenes inverze önmaga 
- póluson át-nem-menő egyenes képe egy póluson átmenő kör

Tehát, nem igaz az, hogy ez a transzformáció egyenestartó lenne, de az sem, hogy az egyenesből mindig kör lesz. Vagy kör lesz vagy egyenes, fazekasos terminológiával ez egy kögyenes (angolul cline/circline). Bár ezt még nem néztük meg a körök képeire, de az inverzió kögyenestartó.

//#block(inset: 8pt, stroke: (left: 2pt), // Left border
//)[
//  Ezen a ponton érdemes lehet bemutatni Geogebra segítségével, ha rendelkezésre áll, hogy hogyan változik át egy egyenes képe körből egyenessé, ahogy egyre közelebb kerül a pólushoz. #link("https://en.wikipedia.org/wiki/Generalised_circle")[A line can be considered as a degenerate circle without a well-defined center and with infinite radius];.
//]

=== Egyenes inverzének megszerkesztése

Oké, mostmár tudjuk biztosan, hogy kört fogunk kapni, ideje hogy eldobjuk a vonalzót és meg is szerkesszük. Vonalzó hiányában ugye nincs egyenesünk, csak két pontunk, amelyek meghatározzák azt. Ahhoz, hogy a kört megszerkesszük, elég meghatároznunk a középpontját, hiszen biztosan átmegy az alapkör középpontján, tehát a sugarat már ismerni fogjuk.

Észrevehetjük azt is, hogy az inverz kör középpontja ($O_2$) fele olyan távol van az inverzió középpontjától ($O_1$), mint az egyenesünk talppontjának az inverze ($T'$). Tehát a definíció szerint $P O'_2 = 2 times P T$. 

Így a következő szerkesztési lépéseket kell elvégeznünk:
- Tükrözzük $O$-t az $e$ egyenesre, így megkapjuk $O'_2$-t
- szerkesszük meg $O'_2$ inverz képét, így megkapjuk $O_2$-t, mivel $O''_2 = O_2$
- rajzoljuk meg a kört $O_2$ középponttal és $O_1 O_2$ sugárral

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.angle: *
    
    set-style(stroke-width: 1pt)
    grid((-3,-3), (7,3), help-lines: true)

    circle((0, 0), radius: 3, name: "k")
    circle((0, 0), radius: 0.05, fill: black, name: "O1")
    content("O1", $ O_1 $, anchor: "north-east", padding: .1)

    line((4, 3.3), (4, -3.3), name: "e", stroke: (dash: "dotted"))
    circle((4, 2.5), radius: 0.05, fill: black, name: "P1")    
    content("P1", $ P_1 $, anchor: "south-west", padding: .1)
    circle((4, -1), radius: 0.05, fill: black, name: "P2")
    content("P2", $ P_2 $, anchor: "north-west", padding: .1)
    arc((4.1, 2.2), start: 0deg, delta: 80deg, radius: 0.6)
    arc((8.2, -0.1), start: 280deg, delta: 80deg, radius: 0.6)
    arc((3.8, -1.4), start: 310deg, delta: 80deg, radius: 0.6)
    arc((8.5, -0.3), start: 350deg, delta: 60deg, radius: 0.6)
    circle((8.45, 0), radius: 0.05, fill: black, name: "O2'")
    content("O2'", $ O'_2 $, anchor: "north-west", padding: .1)
    circle((1.125, 0), radius: 0.05, fill: black, name: "O2")
    content("O2", $ O_2 $, anchor: "north-east", padding: .1)
    circle((), radius: 1.125, stroke: (dash: "dashed"), name: "inv_circ")
    line("O1", "O2", stroke: (dash: "dashed"), name: "a")
  })
]

=== Kör inverze <kör-inverze>
Robogjunk tovább a körökre. Azt tudjuk, hogy az alapkör képe önmaga lesz, és azt is, hogy a póluson át-nem-haladó egyenes képe póluson áthaladó kör lesz. Viszont tudjuk azt is, hogy az inverzió kétszer alkalmazva identitás, tehát a póluson át-nem-menő kör képe egy póluson át-nem-menő egyenes lesz.

Mi a helyzet a póluson át-nem-menő körökkel? Ezúttal is pár pontjának inverziója után körívet vélünk felfedezni. Bizonyítsuk, hogy tényleg igazunk van. 


#align(center)[
  #cetz.canvas(length: 22pt,{
    import cetz.draw: *
    import cetz.angle: *

    circle((0, 0), radius: 3, name: "k")
    circle((0, 0), radius: 0.05, fill: black, name: "O1")
    content("O1", $ O $, anchor: "north", padding: .1)

    line((-3.5, 0), (16, 0))
    circle((3.5, 0), radius: 0.05, fill: black, name: "A")
    circle((15, 0), radius: 0.05, fill: black, name: "B")
    circle((4.0719, 2.5), radius: 0.05, fill: black, name: "C")
    circle((1.5857, 0), radius: 0.05, fill: black, name: "O3")
    circle((), stroke:(dash: "dashed"))
    content("O3", $ O_3 $, anchor: "north", padding: .1)
    content("A", $ A $, anchor: "north-east", padding: .1)
    content("B", $ B $, anchor: "north-west", padding: .1)
    content("C", $ C $, anchor: "south-east", padding: .1)
    circle((9.25, 0), radius: 0.05, fill: black, name: "O2")
    circle((), radius: 5.75)
    content("O2", $ O_2 $, anchor: "north", padding: 0.1)
    line("A", "C")
    line("C", "B")
    line("A", "B")

    circle((1.605, 0.9855), radius: 0.05, fill: black, name: "C'")
    circle((2.5714, 0), radius: 0.05, fill: black, name: "A'")
    circle((0.6, 0), radius: 0.05, fill: black, name: "B'")
    content("A'", $ A' $, anchor: "north-east", padding: .1)
    content("B'", $ B' $, anchor: "north-west", padding: .1)
    content("C'", $ C' $, anchor: "south", padding: .1)
    line("A'", "C'")
    line("C'", "B'")
    line("A'", "B'")
    line("C", "O1")

    right-angle("C", "A", "B")


  })
]

Az ötlet hasonló, mint az egyeneseknél. Vegyük az átmérőt és egy tetszőleges harmadik pontot. Ha az ezek inverzei által alkotott háromszög derékszögű a harmadik csúcsnál, akkor a Thálesz-tétel megfordítása miatt az inverz kép kör lesz. Bár az eredeti körünk harmadik csúcsánál mindenképp derékszög lesz (Thálesz miatt), de nehezedik a dolgunk, mert $A B C triangle.stroked.t tilde.not A' B' C' triangle.stroked.t$. Tudjuk a definíció alapján viszont van két hasonló háromszög párunk ($O B' C' triangle.stroked.t tilde O B' C' triangle.stroked.t$, illetve $O A C triangle.stroked.t &tilde O C' A' triangle.stroked.t$), amikből unalmas szögszámolások segítségével kijön, hogy igen, tényleg derékszöget kapunk, tehát körrel van dolgunk.



// TODO: befejezni

=== Kör inverzének megszerkesztése

A megszerkesztése azonban nem túl egyszerű. Ha ismernénk a lekközelebbi pontját az alapkör középpontjához, illetve az eredeti körünk középpontját (ennek a az inverz képe nem egyezik meg az inverz kör középpontjával!), akkor már megoldható lenne, hiszen elő tudjuk állítani az átmérőt, és szakasz felezéssel/kétszerezéssel már sínen lennénk. Azonban ezt nem feltételezhetjük. 

Kénytelenek vagyunk megtanulni megszerkeszteni egy kör középpontját három adott pontja alapján. Így elég lenne a kör három pontját invertálni, és onnan megkeresni a középpontot, amivel már a kört is meg tudjuk szerkeszteni.

Ahhoz, hogy ezt körző nélkül is meg tudjuk tenni, ismét inverzióhoz fogunk folyamodni. A trükk az alapkör megválasztása. Ha a három pont közül kiválasztunk egyet az inverziója középpontjaként (tetszőleges sugárral), akkor az eredeti körünk egy póluson áthaladó kör lesz. Ennek a képe, mint ahogy azt már korábban megvizsgáltuk, egy póluson át-nem-haladó egyenes lesz. Ez azért nagyon jó nekünk, mert az egyenes inverzének megszerkesztése közben mi megszerkesztettük annak a középpontját is. Így nincs más dolgunk, mint:

- invertáljuk a másik két pontot az alapkörre
- szerkesszük meg az így kapott "egyenes" inverz képének középpontját:
  - tükrözzük $A$-t a $B'C'$ egyenesre, ezzel megkapjuk $O'$-t
  - szerkesszük meg $O'$ inverz képét, így megkapjuk $O$-t

#align(center)[
  
  #cetz.canvas({
    import cetz.draw: *
    import cetz.angle: *

    circle((0, 0), radius: 3, name: "k")
    circle((0, 0), radius: 0.05, fill: black, name: "A")
    content("A", $ A $, anchor: "east", padding: .1)

    circle((3.5, -1), radius: calc.sqrt(13.25), name: "k2")
    circle((), radius: 0.05, fill: black, name: "O")
    content("O", $ O $, anchor: "north", padding: .1)

    circle((2.5, 2.5), radius: 0.05, fill: black, name: "B")
    content("B", $ B $, anchor: "north", padding: .1)

    circle((5.2349, 2.2), radius: 0.05, fill: black, name: "C")
    content("C", $ C $, anchor: "north-east", padding: .1)

    line((2.2857, 3.5), (0, -4.5), stroke: (dash: "dotted"))
    circle((1.8, 1.8), radius: 0.05, fill: black, name: "B'")
    content("B'", $ B' $, anchor: "north-east", padding: .1)

    circle((1.4612, 0.614), radius: 0.05, fill: black, name: "C'")
    content("C'", $ C' $, anchor: "north-east", padding: .1)

    line((3.997, -1.142), (-2.0053, 0.5729))
    right-angle((1.1887, -0.3396), (0, -4.5), "O", radius: 20%)

    
    circle((2.377358490566, -0.6792452830189), radius: 0.05, fill: black, name: "O'")
    content("O'", $ O' $, anchor: "north-east", padding: .1)
  })
]

//#box(image("./media/circle_inversion_construction.png"))




Így meg is vagyunk a kör képével. Összefoglalás a körök és egyenesek inverz képeiről: 
- az alapkör képe önmaga 
- póluson átmenő kör képe póluson át-nem-menő egyenes 
- póluson át-nem-menő kör képe póluson átmenő kör
- póluson átmenő egyenes inverze önmaga 
- póluson át-nem-menő egyenes képe egy póluson átmenő kör
- (az alapkörre #link("https://mathworld.wolfram.com/OrthogonalCircles.html")[merőleges kör] képe önmaga) ($r^2 + R^2 = d(O_1; O_2)^2$)

== Mohr-Mascheroni tétel <mohr-mascheroni-tétel>
Most, hogy mindennek meg tudjuk szerkeszteni az inverz képét (és azokat csak körzővel meg tudjuk szerkeszteni), a nehezén túl vagyunk. Ha meg tudjuk szerkeszteni két egyenes metszéspontját, illetve egy egyenes és egy kör metszéspontját, akkor bebizonyítottuk, hogy mindent, amit meg lehet szerkeszteni körzővel és vonalzóval, azt meg lehet szerkeszteni csak körzővel is.

Aránylag triviális belátni, hogy ha két ponthalmaz metszi egymást, akkor a ponthalmazok inverzei is a metszéspont inverzében metszik egymást. Ez alapján csak annyi dolgunk van hogy olyan alapkört válasszunk, ahol minden egyenesünk és körünk képe kör, megtaláljuk a metszetet, majd a metszéspontot invertáljuk.

#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 3, name: "k")
  circle((0, 0), radius: 0.05, fill: black, name: "O")
  content("O", $ O $, anchor: "north-east", padding: .1)

  circle((2, 4), radius: 0.05, fill: black, name: "A")
  content("A", $ A $, anchor: "north-east", padding: .1)

  circle((4, 2), radius: 0.05, fill: black, name: "B")
  content("B", $ B $, anchor: "north-east", padding: .1)

  circle((4, -1), radius: 0.05, fill: black, name: "C")
  content("C", $ C $, anchor: "north-west", padding: .1)

  circle((3, -3), radius: 0.05, fill: black, name: "D")
  content("D", $ D $, anchor: "north-west", padding: .1)

  line((1,5), (7,-1), stroke: (dash: "dotted"))
  line((2.5, -4),(6.5, 4), stroke: (dash: "dotted"))

  circle((0.75, 0.75), radius: 1.06066, name: "k2", stroke: (dash: "dashed"))
  circle((1, -0.5), radius: 1.118034, name: "k2", stroke: (dash: "dashed"))


  circle((5, 1), radius: 0.05, fill: black, name: "M")
  content("M", $ M $, anchor: "west", padding: .2)
  circle((1.7307692307692, 0.3461538461538), radius: 0.05, fill: black, name: "M'")
  content("M'", $ M' $, anchor: "west", padding: .1)

  circle((0.9, 1.8), radius: 0.05, fill: black, name: "A'")
  content("A'", $ A' $, anchor: "south-west", padding: .1)

  circle((1.8, 0.9), radius: 0.05, fill: black, name: "B'")
  content("B'", $ B' $, anchor: "south-west", padding: .1)

  circle((2.1176, -0.5294), radius: 0.05, fill: black, name: "C'")
  content("C'", $ C' $, anchor: "north-west", padding: .1)

  circle((1.5, -1.5), radius: 0.05, fill: black, name: "D'")
  content("D'", $ D' $, anchor: "north-west", padding: .1)

})
//#box(image("./media/line_line_intersect.png"))



#box(image("./media/circle_line_intersection.png"))

Ezzel be is bizonyítottuk a Mohr-Mascheroni tételt, és szabadon otthon hagyhatjuk mostantól a körzőnket. Juhuuu! Az egyetlen probléma, hogy inkább körzőből szokott hiány lenni, mintsem fordítva…



= Források <források>
- #link("https://artofproblemsolving.com/wiki/index.php/Circular_Inversion")
- #link("https://maa.org/sites/default/files/pdf/ebooks/pdf/EGMO_chapter8.pdf")
- #link("http://www.matek.fazekas.hu/images/cikkek/cikkek_20200920_oroszgyula_inverzios_szerkesztes.pdf")
- #link("https://matkonyv.fazekas.hu/cache/pdf/vol_geometria_iii.pdf")
- #link("https://web.cs.elte.hu/blobs/diplomamunkak/bsc_mattan/2016/gyalog_eszter.pdf")
- #link("https://web.cs.elte.hu/blobs/diplomamunkak/bsc_mattan/2010/maczko_renata.pdf")