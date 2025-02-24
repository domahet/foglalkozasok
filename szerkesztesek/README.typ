#import "@preview/cetz:0.3.2"

= Mohr-Mascheroni szerkesztések <mohr-mascheroni-szerkesztések>
=== Az Euklideszi szerkesztések alaplépései: <az-euklideszi-szerkesztések-alaplépései>
Euklideszi szerkesztésnek hívunk mindent, amit gimiben tanultatok szerkesztés néven. A használható lépések:

#align(center, image("alaplepesek.png", width: 80%)) 

+ A vonalzót két adott ponton átmenő egyenes megrajzolására használhatjuk.
+ A körzővel adott pont körül adott hosszú sugárral kört rajzolhatunk.
+ Két egyenes metszéspontját megjelölhetjük.
+ Egyenes és kör metszéspontját megjelölhetjük.
+ Két kör metszéspontját megjelölhetjük.
+ #strike[Két pont távolságát körzőnyílásba vehetjük.] (távolságok lemérésére vonalzót ugye nem használhatunk, tehát van ennek helye, mint alaplépés, de nem feltétlenül fontos, hogy reprodukálni tudjuk)

Amit ezeknek a véges számú ismétlésével meg lehet szerkeszteni az pacek. Ezekből épül fel akár egy merőleges megszerkesztése is, de az önmagában nem alapművelet. Ugyanakkor nem minden megszerkeszthető (Pl.: szabályos hétszög, szögharmadolás) 

#block(
  fill: luma(240), // Light gray background
  inset: 8pt,     // Padding inside the block
  stroke: (left: 2pt + blue), // Left border
  radius: 4pt,     // Rounded corners
)[
  #strong[Kitektintés] 

Ezeknek a feladatoknak a megszerkeszthetetlenségét algebrailag lehet bizonyítani a #link(
  "https://en.wikipedia.org/wiki/Constructible_number",
)[megszerkeszthető számok] segítségével. Ezek olyan számok, amik egész számokbóé az összeadás, kivonás, szorzás, osztás, gyökvonás műveletek segítségével előállíthatóak. 

Ezek a számok pl távolságok vagy arányok, amiket meg lehet szerkeszteni (szintén bizonyítható, hogy ez oda-vissza működik), és a fenti feladatok megoldásához olyan számot kéne előállítani, ami nem esik ebbe a számcsoportba.

Egy bemelegítő szerkesztés: derékszögű háromszög melynek tudjuk két oldalának hosszát. (Nagyobbaknál ugorhatjuk, ha nem gyökerek/fáradtak) \* Vegyük észre, hogy elég nekünk ha csak magukat a pontokat szerkesztjük meg, az oldalak technikailag csak esztétikai célt szolgálnak!
]

#pagebreak()

=== Körző nélkül <körző-nélkül>
A hat alaplépés közül néhány triviális az egyik eszköz nélkül is, néhány viszont konkrétan lehetetlennek tűnik.

#figure(align(left)[#table(
    columns: (100%), align: (auto,), table.header([Csak körzővel nehéz]), table.hline(), 
    [1. A vonalzót két adott ponton átmenő egyenes megrajzolására használhatjuk.#footnote[ezeket szerencsére nem kell majd implementálnunk, hiszen maga az egyenes vagy kör megrajzolása csak esztétikai célt szolgál, ha a többi lépést meg tudjuk oldani más módon]], 
    [3. Két egyenes metszéspontját megjelölhetjük.], 
    [4. Egyenes és kör metszéspontját megjelölhetjük.], 
  )], kind: table,
)

Ahhoz, hogy ekvivalens legyen a csak körzős szerkesztés az euklidészivel, ahhoz át kell hidalni a hiányzó lépéseket. Viszont #strong[csak a pontokat kell tudnunk megszerkeszteni];, maga a kör, vagy az egyenes megjelenése nem feltétlen szükséges.

Először nézzük meg, hogy mi az, ami egyáltalán eszünkbe jut, hogy az egyik eszköz nélkül meg tudjuk szerkeszteni, #emph[egyelőre bármilyen mágia nélkül];.

- tükrözés (ha meg van adva a tükör-tengely)
- szabályos háromszög/hatszög
- szakasz duplázás

Folytassuk a dolgokat csak körzővel, az úgyis jobban ment. Ahhoz, hogy pótolni tudjuk a hiányzó lépéseket, ahhoz létre kell hoznunk egy új geometriai transzformációt, a körre tükrözést. Az lesz az elképzelés, hogy #emph[valahogy] körökké alakítjuk, az "egyeneseinket", így tudjuk őket kezelni, és ha megvagyunk, visszaalakíthatjuk őket.

=== Geometriai transzformációk <geometriai-transzformációk>
Na de mi az a geometriai transzormáció? Technikailag egy 4D függvény, ami bijektív, tehát van inverze, és lefedi mindkét halmazt. Ugye síkbeli függvényeknél a valós számokhoz rendelünk hozzá másik valós számokat, itt viszont számpárokhoz másik számpárokat, tehát R-\>R helyett X2-\>X2. Bijekció az egy specifikus egy-az-egyhez hozzárendelés, az egyértelmű függvény.



#align(center,image("Injective-Function-5.png", width: 80%))

#quote(
  block: true,
)[
  #strong[Opcionális] Próbáljunk meg hozzárendelést találni az alábbi objektumok között! 
  - szakasz és hosszabb szakasz 
  - szakasz és körív 
  - szakasz és végpontok nélküli szakasz 
  - szakasz és egyenes 
  - körlap és sík 
  - szakasz és sík
]

Az általunk ismert geometriai transzformációk, általában mind szögtartóak, egyenestartóak és távolságtartóak (kivéve a hasonlóság), szóval nem csoda, ha nem tudjuk emlékezetből sorolni a tulajdonságaikat - forgatás - eltolás - pontra/egyenesre tükrözés - hasonlóság

== Inverzió <inverzió>
Nekünk olyan transzformáció kell, ami #strong[nem] egyenestartó! Hogy néz ki egy ilyen?… Egy P pont O középpontú, r sugarú körre vett inverz képét úgy kapjuk meg, hogy $O P times O P' = r^2$. Most még egyelőre csak higyjük el, hogy ez nem lesz egyenestartó és kezdjünk el inkább azon gondolkodni, hogy hogyan szerkesszük meg.

//#align(center, image("./inversion_def.png", width: 80%))

#cetz.canvas({
  import cetz.draw: *
  
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

  line((0.66666667, 1.885618), (0.66666667, -1.885618))
  circle((0.66666667, -1.885618), radius: 0.05, fill: black, name: "N'")
  content("N'", $ N' $, anchor: "north", padding: .2)

  //line("P", (element: "k", point: "P", solution: 1), "P", stroke: red)
  line((6, 0), (angle: 90deg, radius: 2.1213), stroke: (dash: "dashed"))
  //line("P", (element: "k", point: "P", solution: 2), "P", stroke: red)
  line((0,0), (0.66666667, 1.885618), stroke: (dash: "dashed"))

  
})

Ha kicsit átrendezzük a definíció egyenletét, akkor azt kapjuk, hogy $frac(O P, r)$ = $frac(r, O P')$ , amit önmagában még valószínűleg nem láttál, mint képlet, de az összetört lelkekben felmerülhet a gyanú, hogy ahol ilyet látok, ott hasonló háromszögekról van szó. Jelöljük be a sugarat, nevezzük el N-nek az új pontot, és meg is vannak a háromszögeink. $O P' N triangle.stroked.t$ \~ $O N P triangle.stroked.t$ \~ $N P' P triangle.stroked.t$ , ahol az $O N$ oldal az $r .$ Itt technikailag nincs is szükségünk a harmadik hasonló háromszögre, de nem baj. Szerkesszük meg az inverziót! (Tipp: derékszögű háromszög -\> Thalesz-tétel) Na de ácsi, mi csak körzővel akarunk szerkeszteni, mi meg itt merőlegest állítotttunk meg mindent! Próbáljuk meg megszerkeszteni ezúttal csak körzővel

#cetz.canvas({
  import cetz.draw: *
  grid((-3.5,-3), (8,3), help-lines: true)
  scale(2.5)
  //grid((-1.5,-1.25), (2.5,1.25), help-lines: true)
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



#quote(
  block: true,
)[
  Meggondolandó az az eset, mikor $𝑂 𝑃 lt.eq 𝑟^2$, hisz ekkor 𝑃-ből 𝑂𝑃 távolsággal kört rajzolva csak egy metszéspontjuk lesz, vagy nem fogják metszeni egymást. Az ilyen esetek megoldásának kulcsa az, hogy körző segítségével az 𝑂𝑃 távolságot a 𝑃 ponton túl annyiszor kétszerezzük meg, hogy nagyobb legyen, mint $𝑟^2$, s így adódik már két metszéspont, és a fent leírtakat tudjuk alkalmazni.
]

Egy kis összefoglalás a triviális észrevételekről: - az inverzió kétszer alkalmazva identitás, visszakapjuk az eredeti alakzatokat - az alapkörön belüli pontokat, az alapkörön kívülre képzi és vica versa - az alapkör képe önmaga - az origón átmenő egyenes képe önmaga - problémás az alapkör középpontjának inverze. \>Ezt vagy ignoráljuk, és elfogadjuk, hogy az inverziót nem definiáljuk erre pontra és egy részleges függvénnyel dolgozunk tovább (mint az $f (x) = 1 / x$), vagy létrehozzzuk A Végtelenben Lévő Pontot, és ez a két pont egymás inverze lesz. Elképzelésére segítségül hívhatjuk a Riemann-gömböt, és definiálása hasznos lesz a kögyeneseknél. A választás nem befolyásolja a szerkesztéseink lehetségességét.

#quote(
  block: true,
)[
  #strong[#link(
      "https://en.wikipedia.org/wiki/Point_at_infinity",
    )[A Végtelenben Lévő pont];] A nullával való osztás nincs definiálva, ugyanis lehet $+ oo$ és $- oo$ is. Jó ez így nem túl precíz, de ahhoz jobban bele kéne menni az analízisbe, és ez most megfelel nekünk. A $P (oo)$-vel kiegészített számhalmazon ez viszont nem probléma. Egyszerűen felvesszük #emph[valahol] a síkon, és azt mondjuk, hogy létezik és $0$ inverze. A Riemann gömb alapvetően a kiegészített komplex számhalmaz modellje, de mivel a komplex sík megfeleltethető az általunk használt síkkal, ezért egy picit kölcsönvesszük szemléltetésképpen.
  Ezzel pontosan három pont definiál minden kögyenest: a köröket is három, az egyeneseket pedig két pont illetve a VLP.
]

=== Egyenes inverze <egyenes-inverze>
Ahhoz, hogy meg tudjuk szerkeszteni egy egyenes inverzét, ahhoz először is tudnunk kell, hogy mit akarunk kapni. Mi lesz egy egyenes inverz képe? Ahogy azt már láttuk, a póluson átmenő egyenes képe önmaga. De én azt ígértem nektek, hogy az inverzió nem lesz egyenestartó, és ez így is van. nézzünk meg egy másik, a póluson át-nem-menő egyenest is. Invertáljuk néhány pontját, és nézzük meg mit kaptunk. Ez bizony egy kör. Bizonyítsuk be, hogy tényleg kört kapunk.

#box(image("./Line_inversion_proof.png"))

Invertáljunk két pontot: egy tetszőlegesen választott $P$ pontot, illetve $T$-t, ami az $O$-ból állított merőleges talppontja az $e$ egyenesen. Az inverzió tulajdonságaiból adódik, hogy $O P' T' triangle.stroked.t tilde.op O T P triangle.stroked.t$, és mivel $O T P angle$ derékszög, ezért $O P' T' angle$ is derékszög bármely szabadon választott $P$ pontra.

A Thálesz tétel kimondja, hogy ha egy $C$ pont a kör ívén van (de nem az átmérőn), akkor az átmérő $C$-ből derékszög alatt látszik. Itt ennek a megfordítását fogjuk felhasználni, tehát ha az átmérő egy $C$ pontból derékszögben látszik, akkor $C$ a köríven van (de nem az átmérőn).

Eddig a következőket tudjuk az egyenesek inverz képéről: - póluson átmenő egyenes inverze önmaga - póluson át-nem-menő egyenes képe egy póluson átmenő kör

Tehát, nem igaz az, hogy ez a transzformáció egyenestartó lenne, de az sem, hogy az egyenesből mindig kör lesz. Vagy kör lesz vagy egyenes, fazekasos terminológiával ez egy kögyenes (angolul cline/circline). Bár ezt még nem néztük meg a körök képeire, de az inverzió kögyenestartó.

#quote(
  block: true,
)[
  Ezen a ponton érdemes lehet bemutatni Geogebra segítségével, ha rendelkezésre áll, hogy hogyan változik át egy egyenes képe körből egyenessé, ahogy egyre közelebb kerül a pólushoz. #link(
    "https://en.wikipedia.org/wiki/Generalised_circle",
  )[A line can be considered as a degenerate circle without a well-defined center and with infinite radius];.
]

Oké, szóval kör lesz. Szerkesszük meg. A két adott pontunk segítségével (amik meghatározzák az egyenest) tengelyesen tükrözzük az inverzió középpontját, ez lesz az általunk keresett kör középpontjának az inverz képe. Miért? A második képen fel van tüntetve a bizonyításnál is használt $T$ talppont. A $C$ pont fele olyan távol van az $O$ ponttól, mint $T'$, hiszen $O T'$ a kör átmérője, tehát az inverzió alkalmazása után a $C'$ pont kétszer olyan távol lesz a középponttól, mint $T'' = T$.

=== Kör inverze <kör-inverze>
Robogjunk tovább a körökre. Kezdjük a legtriviálisabbal: az alapkör képe önmaga. Eggyel kevésbe magától értetődő, de a korábbi állításainkból könnyen belátható, hogy egy póluson átmenő kör képe egy póluson át-nem-menő egyenes lesz, hiszen az inverzió kétszer alkalmazva identitás. Nézzük a póluson át-nem-menő köröket! Ezeknek a képe póluson át-nem-menő kör lesz.

#strong[insert bizonyítás!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!];.

Mielőtt azonban megszerkesztenénk, tegyünk egy nagyon rövid kitérőt, amit meg fogtok köszönni. Szerkesszük meg egy kör középpontját három adott pontja alapján! Ha ezt meg tudjuk csinálni, akkor nem kell semmiféle spéci szerkesztési technika, egyszerűen csak invertálunk három pontot, és mivel tudjuk, hogy ezek egy körön lesznek, ezért csak meg kell keresnünk a középpontot. Szerencsére ez sem lesz nehéz.

#box(image("./circle_inversion_construction.png"))

Szépen kiválasztjuk a három megadott pontból találomra az egyiket, tetszőleges sugárral kört rajzolunk, és ez lesz az inverziónk alapköre. Így az eredeti körünk az egy póluson átmenő kör lesz, aminek tudjuk, hogy a képe egyenes. Invertáljuk a maradék két pontunkat, ezzel meg is kaptuk az egyenesünket. Innen az egyenes képét megadó algoritmust követjük, akkor visszakapjunk a körünket, de közben megkaptuk a középpontját is.

Így meg is vagyunk a kör képével. Összefoglalás a körökkel: - az alapkör képe önmaga - póluson átmenő kör képe póluson át-nem-menő egyenes - póluson át-nem-menő kör képe póluson átmenő kör - (az alapkörre #link("https://mathworld.wolfram.com/OrthogonalCircles.html")[merőleges kör] képe önmaga)

== Mohr-Mascheroni tétel <mohr-mascheroni-tétel>
Most, hogy mindennek meg tudjuk szerkeszteni az inverz képét (és azokat csak körzővel meg tudjuk szerkeszteni), a nehezén túl vagyunk. Ha meg tudjuk szerkeszteni két egyenes metszéspontját, illetve egy egyenes és egy kör metszéspontját, akkor bebizonyítottuk, hogy mindent, amit meg lehet szerkeszteni körzővel és vonalzóval, azt meg lehet szerkeszteni csak körzővel is.

Na lássuk a medvét! Adott két pontpárunk, amik meghatároznak egy-egy, egymással nem párhuzamos egyenest, szerkesszük meg a metszéspontot. Nem lesz nehéz dolgunk. Invertáljuk az egyeneseinket, és kapni fogunk két kört amelyek két pontban metszik egymást: az origóban($P (oo)$ miatt), illetve ott, ahol az általunk keresett pont inverze található. Invertáljuk, és meg is vagyunk.

#box(image("./line_line_intersect.png"))

Nem lesz ez nagyon máshogy a kör-egyenes esetben sem. Invertáljuk az alakzatokat, megkapjuk a metszéspont(ok) képe(i)-t, ez(ek)-nek az inverz képe pedig az eredeti metszéspont(ok) lesz(nek). Pontosan annyi metszéspontja lesz a két képkörnek, ahány az eredeti alakzatoknak volt,

#box(image("./circle_line_intersection.png"))

Ezzel be is bizonyítottuk a Mohr-Mascheroni tételt, és szabadon otthon hagyhatjuk mostantól a körzőnket. Juhuuu! Az egyetlen probléma, hogy inkább körzőből szokott hiány lenni, mintsem fordítva…



= Források <források>
- https:\/\/artofproblemsolving.com/wiki/index.php/Circular\_Inversion
- https:\/\/maa.org/sites/default/files/pdf/ebooks/pdf/EGMO\_chapter8.pdf
- http:\/\/www.matek.fazekas.hu/images/cikkek/cikkek\_20200920\_oroszgyula\_inverzios\_szerkesztes.pdf
- https:\/\/matkonyv.fazekas.hu/cache/pdf/vol\_geometria\_iii.pdf
- https:\/\/web.cs.elte.hu/blobs/diplomamunkak/bsc\_mattan/2016/gyalog\_eszter.pdf
- https:\/\/web.cs.elte.hu/blobs/diplomamunkak/bsc\_mattan/2010/maczko\_renata.pdf
