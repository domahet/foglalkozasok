== Table of Contents
<table-of-contents>
- #link(<mohr-mascheroni-szerkesztések>)[Mohr-Mascheroni szerkesztések]
  - #link(<az-euklideszi-szerkesztések-alaplépései>)[Az Euklideszi szerkesztések alaplépései:]
  - #link(<körző-vagy-vonalzó-nélkül>)[Körző vagy vonalzó nélkül]
  - #link(<geometriai-transzformációk>)[Geometriai transzformációk]
  - #link(<inverzió>)[Inverzió]
    - #link(<egyenes-inverze>)[Egyenes inverze]
    - #link(<kör-inverze>)[Kör inverze]
  - #link(<mohr-mascheroni-tétel>)[Mohr-Mascheroni tétel]
- #link(<poncelet-steiner-tétel>)[Poncelet-Steiner tétel]
  - #link(<eszközváltás>)[Eszközváltás]
  - #link(<szomorú-tény>)[Szomorú tény]
- #link(<források>)[Források]

= Mohr-Mascheroni szerkesztések
<mohr-mascheroni-szerkesztések>
=== Az Euklideszi szerkesztések alaplépései:
<az-euklideszi-szerkesztések-alaplépései>
Euklideszi szerkesztésnek hívunk mindent, amit gimiben tanultatok
szerkesztés néven. A használható lépések:

#box(image("media/alaplepesek.png"))

+ A vonalzót két adott ponton átmenő egyenes megrajzolására
  használhatjuk.
+ A körzővel adott pont körül adott hosszú sugárral kört rajzolhatunk.
+ Két egyenes metszéspontját megjelölhetjük.
+ Egyenes és kör metszéspontját megjelölhetjük.
+ Két kör metszéspontját megjelölhetjük.
+ #strike[Két pont távolságát körzőnyílásba vehetjük.] (távolságok
  lemérésére vonalzót ugye nem használhatunk, tehát van ennek helye,
  mint alaplépés, de nem feltétlenül fontos, hogy reprodukálni tudjuk)

Amit ezeknek a véges számú ismétlésével meg lehet szerkeszteni az pacek.
Ezekből épül fel akár egy merőleges megszerkesztése is, de az önmagában
nem alapművelet. Ugyanakkor nem minden megszerkeszthető (Pl.: szabályos
hétszög, szögharmadolás) \> #strong[Kitektintés] \> Ezeknek a
feladatoknak a megszerkeszthetetlenségét algebrailag lehet bizonyítani a
#link("https://en.wikipedia.org/wiki/Constructible_number")[megszerkeszthető számok]
segítségével. Ezek olyan számok, amik egész számokbóé az összeadás,
kivonás, szorzás, osztás, gyökvonás műveletek segítségével
előállíthatóak. \> Ezek a számok pl távolságok vagy arányok, amiket meg
lehet szerkeszteni (szintén bizonyítható, hogy ez oda-vissza működik),
és a fenti feladatok megoldásához olyan számot kéne előállítani, ami nem
esik ebbe a számcsoportba.

Egy bemelegítő szerkesztés: derékszögű háromszög melynek tudjuk két
oldalának hosszát. (Nagyobbaknál ugorhatjuk, ha nem gyökerek/fáradtak)
\* Vegyük észre, hogy elég nekünk ha csak magukat a pontokat
szerkesztjük meg, az oldalak technikailag csak esztétikai célt
szolgálnak!

=== Körző vagy vonalzó nélkül
<körző-vagy-vonalzó-nélkül>
A hat alaplépés közül néhány triviális az egyik eszköz nélkül is, néhány
viszont konkrétan lehetetlennek tűnik.

#figure(
  align(center)[#table(
    columns: (100%),
    align: (auto,),
    table.header([Csak körzővel nehéz],),
    table.hline(),
    [1. A vonalzót két adott ponton átmenő egyenes megrajzolására
    használhatjuk.\*],
    [3. Két egyenes metszéspontját megjelölhetjük.],
    [4. Egyenes és kör metszéspontját megjelölhetjük.],
    [3. Két egyenes metszéspontját megjelölhetjük.],
    [4. Egyenes és kör metszéspontját megjelölhetjük.],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: (100%),
    align: (auto,),
    table.header([Csak vonalzóval nehéz],),
    table.hline(),
    [2. A körzővel adott pont körül adott hosszú sugárral kört
    rajzolhatunk.\*],
    [4. Egyenes és kör metszéspontját megjelölhetjük.],
    [5. Két kör metszéspontját megjelölhetjük.],
    [#strike[\6. Két pont távolságát körzőnyílásba vehetjük.];],
  )]
  , kind: table
  )

\* ezeket szerencsére nem kell majd implementálnunk, hiszen maga az
egyenes vagy kör megrajzolása csak esztétikai célt szolgál, ha a többi
lépést meg tudjuk oldani más módon

Ahhoz, hogy ekvivalens legyen a csak körző/vonalzós szerkesztés az
euklidészivel, ahhoz át kell hidalni a hiányzó lépéseket. Viszont
#strong[csak a pontokat kell tudnunk megszerkeszteni];, maga a kör, vagy
az egyenes megjelenése nem feltétlen szükséges.

Először nézzük meg, hogy mi az, ami egyáltalán eszünkbe jut, hogy az
egyik eszköz nélkül meg tudjuk szerkeszteni, #emph[egyelőre bármilyen
mágia nélkül];. (Itt hagyhatunk egy kis időt, hadd gondolkodjanak. Úgyse
fognak tudni csak vonalzósat mondani, hacsak nem tanulták már)

- tükrözés (ha meg van adva a tükör-tengely)
- szabályos háromszög/hatszög
- szakasz duplázás

Folytassuk a dolgokat csak körzővel, az úgyis jobban ment. Ahhoz, hogy
pótolni tudjuk a hiányzó lépéseket, ahhoz létre kell hoznunk egy új
geometriai transzformációt, a körre tükrözést. Az lesz az elképzelés,
hogy #emph[valahogy] körökké alakítjuk, az "egyeneseinket", így tudjuk
őket kezelni, és ha megvagyunk, visszaalakíthatjuk őket.

=== Geometriai transzformációk
<geometriai-transzformációk>
Na de mi az a geometriai transzormáció? Technikailag egy 4D függvény,
ami bijektív, tehát van inverze, és lefedi mindkét halmazt. Ugye síkbeli
függvényeknél a valós számokhoz rendelünk hozzá másik valós számokat,
itt viszont számpárokhoz másik számpárokat, tehát R-\>R helyett X2-\>X2.
Bijekció az egy specifikus egy-az-egyhez hozzárendelés, az egyértelmű
függvény.

#quote(block: true)[
#strong[Kitektintés] Példa egy 3D függvényre a parametrikus görbe. Pl.:
\[0, 2π\] -\> R2 : $f (t) = (s i n (t) \, c o s (t))$. Ez egy kört
rajzol ki, amit síkbeli függvénnyel nem érhetnénk el, ugyanis a kör
egyenletét rendezve azt kapjuk, hogy $y = sqrt(1 - x)$ , ami az alsó
félkört nem rajzolja ki, ugyanis egyrészt így definiáljuk a
gyökfüggvényt, másrészt, ha kirajzolná, akkor nem lenne függvény.
]

#box(image("media/Injective-Function-5.png"))

#quote(block: true)[
#strong[Opcionális] Próbáljunk meg hozzárendelést találni az alábbi
objektumok között! - szakasz és hosszabb szakasz - szakasz és körív -
szakasz és végpontok nélküli szakasz - szakasz és egyenes - körlap és
sík - szakasz és sík
]

Az általunk ismert geometriai transzformációk, általában mind
szögtartóak, egyenestartóak és távolságtartóak (kivéve a hasonlóság),
szóval nem csoda, ha nem tudjuk emlékezetből sorolni a tulajdonságaikat
\- forgatás - eltolás - pontra/egyenesre tükrözés - hasonlóság

== Inverzió
<inverzió>
Nekünk olyan transzformáció kell, ami #strong[nem] egyenestartó! Hogy
néz ki egy ilyen?… Egy P pont O középpontú, r sugarú körre vett inverz
képét úgy kapjuk meg, hogy $O P times O P' = r^2$. Most még egyelőre
csak higyjük el, hogy ez nem lesz egyenestartó és kezdjünk el inkább
azon gondolkodni, hogy hogyan szerkesszük meg.

#box(image("./media/inversion_def.png"))

Ha kicsit átrendezzük a definíció egyenletét, akkor azt kapjuk, hogy
$frac(O P, r)$ = $frac(r, O P')$ , amit önmagában még valószínűleg nem
láttál, mint képlet, de az összetört lelkekben felmerülhet a gyanú, hogy
ahol ilyet látok, ott hasonló háromszögekról van szó. Jelöljük be a
sugarat, nevezzük el N-nek az új pontot, és meg is vannak a
háromszögeink. $O P' N triangle.stroked.t$ \~ $O N P triangle.stroked.t$
\~ $N P' P triangle.stroked.t$ , ahol az $O N$ oldal az $r .$ Itt
technikailag nincs is szükségünk a harmadik hasonló háromszögre, de nem
baj. Szerkesszük meg az inverziót! (Tipp: derékszögű háromszög -\>
Thalesz-tétel) Na de ácsi, mi csak körzővel akarunk szerkeszteni, mi meg
itt merőlegest állítotttunk meg mindent! Próbáljuk meg megszerkeszteni
ezúttal csak körzővel

#box(image("./media/inversion_def_via_compass.png"))

#quote(block: true)[
Meggondolandó az az eset, mikor $𝑂 𝑃 lt.eq 𝑟^2$, hisz ekkor 𝑃-ből 𝑂𝑃
távolsággal kört rajzolva csak egy metszéspontjuk lesz, vagy nem fogják
metszeni egymást. Az ilyen esetek megoldásának kulcsa az, hogy körző
segítségével az 𝑂𝑃 távolságot a 𝑃 ponton túl annyiszor kétszerezzük meg,
hogy nagyobb legyen, mint $𝑟^2$, s így adódik már két metszéspont, és a
fent leírtakat tudjuk alkalmazni.
]

Egy kis összefoglalás a triviális észrevételekről: - az inverzió kétszer
alkalmazva identitás, visszakapjuk az eredeti alakzatokat - az alapkörön
belüli pontokat, az alapkörön kívülre képzi és vica versa - az alapkör
képe önmaga - az origón átmenő egyenes képe önmaga - problémás az
alapkör középpontjának inverze. \>Ezt vagy ignoráljuk, és elfogadjuk,
hogy az inverziót nem definiáljuk erre pontra és egy részleges
függvénnyel dolgozunk tovább (mint az $f (x) = 1 / x$), vagy
létrehozzzuk A Végtelenben Lévő Pontot, és ez a két pont egymás inverze
lesz. Elképzelésére segítségül hívhatjuk a Riemann-gömböt, és
definiálása hasznos lesz a kögyeneseknél. A választás nem befolyásolja a
szerkesztéseink lehetségességét.

#quote(block: true)[
#strong[#link("https://en.wikipedia.org/wiki/Point_at_infinity")[A Végtelenben Lévő pont];]
A nullával való osztás nincs definiálva, ugyanis lehet $+ oo$ és $- oo$
is. Jó ez így nem túl precíz, de ahhoz jobban bele kéne menni az
analízisbe, és ez most megfelel nekünk. A $P (oo)$-vel kiegészített
számhalmazon ez viszont nem probléma. Egyszerűen felvesszük
#emph[valahol] a síkon, és azt mondjuk, hogy létezik és $0$ inverze. A
Riemann gömb alapvetően a kiegészített komplex számhalmaz modellje, de
mivel a komplex sík megfeleltethető az általunk használt síkkal, ezért
egy picit kölcsönvesszük szemléltetésképpen.
Ezzel pontosan három pont definiál minden kögyenest: a köröket is három,
az egyeneseket pedig két pont illetve a VLP.
]

=== Egyenes inverze
<egyenes-inverze>
Ahhoz, hogy meg tudjuk szerkeszteni egy egyenes inverzét, ahhoz először
is tudnunk kell, hogy mit akarunk kapni. Mi lesz egy egyenes inverz
képe? Ahogy azt már láttuk, a póluson átmenő egyenes képe önmaga. De én
azt ígértem nektek, hogy az inverzió nem lesz egyenestartó, és ez így is
van. nézzünk meg egy másik, a póluson át-nem-menő egyenest is.
Invertáljuk néhány pontját, és nézzük meg mit kaptunk. Ez bizony egy
kör. Bizonyítsuk be, hogy tényleg kört kapunk.

#box(image("./media/Line_inversion_proof.png"))

Invertáljunk két pontot: egy tetszőlegesen választott $P$ pontot,
illetve $T$-t, ami az $O$-ból állított merőleges talppontja az $e$
egyenesen. Az inverzió tulajdonságaiból adódik, hogy
$O P' T' triangle.stroked.t tilde.op O T P triangle.stroked.t$, és mivel
$O T P angle$ derékszög, ezért $O P' T' angle$ is derékszög bármely
szabadon választott $P$ pontra.

A Thálesz tétel kimondja, hogy ha egy $C$ pont a kör ívén van (de nem az
átmérőn), akkor az átmérő $C$-ből derékszög alatt látszik. Itt ennek a
megfordítását fogjuk felhasználni, tehát ha az átmérő egy $C$ pontból
derékszögben látszik, akkor $C$ a köríven van (de nem az átmérőn).

Eddig a következőket tudjuk az egyenesek inverz képéről: - póluson
átmenő egyenes inverze önmaga - póluson át-nem-menő egyenes képe egy
póluson átmenő kör

Tehát, nem igaz az, hogy ez a transzformáció egyenestartó lenne, de az
sem, hogy az egyenesből mindig kör lesz. Vagy kör lesz vagy egyenes,
fazekasos terminológiával ez egy kögyenes (angolul cline/circline). Bár
ezt még nem néztük meg a körök képeire, de az inverzió kögyenestartó.

#quote(block: true)[
Ezen a ponton érdemes lehet bemutatni Geogebra segítségével, ha
rendelkezésre áll, hogy hogyan változik át egy egyenes képe körből
egyenessé, ahogy egyre közelebb kerül a pólushoz.
#link("https://en.wikipedia.org/wiki/Generalised_circle")[A line can be considered as a degenerate circle without a well-defined center and with infinite radius];.
]

Oké, szóval kör lesz. Szerkesszük meg. A két adott pontunk segítségével
(amik meghatározzák az egyenest) tengelyesen tükrözzük az inverzió
középpontját, ez lesz az általunk keresett kör középpontjának az inverz
képe. Miért? A második képen fel van tüntetve a bizonyításnál is
használt $T$ talppont. A $C$ pont fele olyan távol van az $O$ ponttól,
mint $T'$, hiszen $O T'$ a kör átmérője, tehát az inverzió alkalmazása
után a $C'$ pont kétszer olyan távol lesz a középponttól, mint
$T'' = T$.

=== Kör inverze
<kör-inverze>
Robogjunk tovább a körökre. Kezdjük a legtriviálisabbal: az alapkör képe
önmaga. Eggyel kevésbe magától értetődő, de a korábbi állításainkból
könnyen belátható, hogy egy póluson átmenő kör képe egy póluson
át-nem-menő egyenes lesz, hiszen az inverzió kétszer alkalmazva
identitás. Nézzük a póluson át-nem-menő köröket! Ezeknek a képe póluson
át-nem-menő kör lesz.

#strong[insert
bizonyítás!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!];.

Mielőtt azonban megszerkesztenénk, tegyünk egy nagyon rövid kitérőt,
amit meg fogtok köszönni. Szerkesszük meg egy kör középpontját három
adott pontja alapján! Ha ezt meg tudjuk csinálni, akkor nem kell
semmiféle spéci szerkesztési technika, egyszerűen csak invertálunk három
pontot, és mivel tudjuk, hogy ezek egy körön lesznek, ezért csak meg
kell keresnünk a középpontot. Szerencsére ez sem lesz nehéz.

#box(image("./media/circle_inversion_construction.png"))

Szépen kiválasztjuk a három megadott pontból találomra az egyiket,
tetszőleges sugárral kört rajzolunk, és ez lesz az inverziónk alapköre.
Így az eredeti körünk az egy póluson átmenő kör lesz, aminek tudjuk,
hogy a képe egyenes. Invertáljuk a maradék két pontunkat, ezzel meg is
kaptuk az egyenesünket. Innen az egyenes képét megadó algoritmust
követjük, akkor visszakapjunk a körünket, de közben megkaptuk a
középpontját is.

Így meg is vagyunk a kör képével. Összefoglalás a körökkel: - az alapkör
képe önmaga - póluson átmenő kör képe póluson át-nem-menő egyenes -
póluson át-nem-menő kör képe póluson átmenő kör - (az alapkörre
#link("https://mathworld.wolfram.com/OrthogonalCircles.html")[merőleges kör]
képe önmaga)

== Mohr-Mascheroni tétel
<mohr-mascheroni-tétel>
Most, hogy mindennek meg tudjuk szerkeszteni az inverz képét (és azokat
csak körzővel meg tudjuk szerkeszteni), a nehezén túl vagyunk. Ha meg
tudjuk szerkeszteni két egyenes metszéspontját, illetve egy egyenes és
egy kör metszéspontját, akkor bebizonyítottuk, hogy mindent, amit meg
lehet szerkeszteni körzővel és vonalzóval, azt meg lehet szerkeszteni
csak körzővel is.

Na lássuk a medvét! Adott két pontpárunk, amik meghatároznak egy-egy,
egymással nem párhuzamos egyenest, szerkesszük meg a metszéspontot. Nem
lesz nehéz dolgunk. Invertáljuk az egyeneseinket, és kapni fogunk két
kört amelyek két pontban metszik egymást: az origóban($P (oo)$ miatt),
illetve ott, ahol az általunk keresett pont inverze található.
Invertáljuk, és meg is vagyunk.

#box(image("./media/line_line_intersect.png"))

Nem lesz ez nagyon máshogy a kör-egyenes esetben sem. Invertáljuk az
alakzatokat, megkapjuk a metszéspont(ok) képe(i)-t, ez(ek)-nek az inverz
képe pedig az eredeti metszéspont(ok) lesz(nek). Pontosan annyi
metszéspontja lesz a két képkörnek, ahány az eredeti alakzatoknak volt,

#box(image("./media/circle_line_intersection.png"))

Ezzel be is bizonyítottuk a Mohr-Mascheroni tételt, és szabadon otthon
hagyhatjuk mostantól a körzőnket. Juhuuu! Az egyetlen probléma, hogy
inkább körzőből szokott hiány lenni, mintsem fordítva…

= Források
<források>
- https:\/\/artofproblemsolving.com/wiki/index.php/Circular\_Inversion
- https:\/\/maa.org/sites/default/files/pdf/ebooks/pdf/EGMO\_chapter8.pdf
- http:\/\/www.matek.fazekas.hu/images/cikkek/cikkek\_20200920\_oroszgyula\_inverzios\_szerkesztes.pdf
- https:\/\/matkonyv.fazekas.hu/cache/pdf/vol\_geometria\_iii.pdf
- https:\/\/web.cs.elte.hu/blobs/diplomamunkak/bsc\_mattan/2016/gyalog\_eszter.pdf
- https:\/\/web.cs.elte.hu/blobs/diplomamunkak/bsc\_mattan/2010/maczko\_renata.pdf
