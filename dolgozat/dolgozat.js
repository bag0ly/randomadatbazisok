//1.feladat
const arr = []
for (let index = 0; index < 10; index++) {
    arr[index]=(Math.round(Math.random()*90+10))
}
console.table(arr)
arr.sort()
console.log(arr)
arr.reverse()
console.log(arr)
arr.shift()
console.log(arr)
arr.pop()
console.log(arr)
arr.unshift(99)
arr.unshift(98)
console.log(arr)
arr.push(99)
console.log(arr)
//2.feladat
function Tantargy(nev,oktato,hely,koltseg=60000){
    this.nev=nev
    this.oktato=oktato
    this.hely=hely
    this.koltseg=koltseg
}
const magyar = new Tantargy("Nyelvtan","Kis Miklós","Ózd")
const matek  = new Tantargy("Matematika","Nicocado Avocado","Lyukóbánya")
console.log(magyar)
console.log(matek)
matek.hely="Ukrajna"
console.log(matek)
magyar.koltseg=300000
console.log(magyar)
//3.feladat
const arr2 = ["asd","asd2","asd3","asd4","asd5"]
for(let x of arr2.keys())
{
    console.log("\n"+arr2[x])
}
//4.feladat
const nevek ={
    András:{
        bevetel:3000,
        kivetel:2000
    },
    Béla:{
        bevetel:5000,
        kivetel:4000
    },
    Andrea:{
        bevetel:8000,
        kivetel:4000
    },
    Ferenc:{
        bevetel:9000,
        kivetel:42000
    }

}
nevek.Mariann={bevetel:10000,kivetel:9000}
console.table(nevek)
//5.feladat
let allatok=new Map([
    ["fecske",Math.round(Math.random()*10+1)],
    ["macska",Math.round(Math.random()*10+1)],
    ["kutya",Math.round(Math.random()*10+1)],
    ["cica",Math.round(Math.random()*10+1)],
    ["hörcsög",Math.round(Math.random()*10+1)],
    ["vakond",Math.round(Math.random()*10+1)]
])
console.table(allatok)
console.log(allatok instanceof Map)
console.log(typeof allatok)
console.log(allatok.size)
allatok.delete("fecske")
console.table(allatok)
allatok.clear()
console.log(allatok.size)
