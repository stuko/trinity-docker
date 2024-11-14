const canvas = document.querySelector('canvas')
const c = canvas.getContext("2d")
canvas.width = window.innerWidth
canvas.height = window.innerHeight

class Panel{
    constructor(w, h){
        this.w = w
        this.h = h
        this.margin = 10
        this.multipleHeight = 4
        this.laneCount = 4
        let oneRow = h/(this.multipleHeight+1)
        let lastRow = h - oneRow
        this.menuX = (canvas.width - w)/2 // ~ w
        this.menuY = (canvas.height - h)/2 // ~ h
        this.menu = new Menu(this.menuX+this.margin,this.menuY+this.margin,w-this.margin*2, oneRow-this.margin*2, 'red')  

        this.lanes = []
        let px = this.menuX
        let py = this.menuY + oneRow
        let ph = lastRow / this.laneCount
        for(let i = 1; i <= this.laneCount; i++){
            let lane = new Lane(px+this.margin,py,w-this.margin*2,ph-this.margin,'white')  
            py += (ph)
            this.lanes.push(lane)
        }
    }
    draw(){
        this.menu.draw()
        this.lanes.forEach(lane => {
            lane.draw()
        })
    }
    show(){
        this.lanes.forEach(lane=>{
            lane.showEnemy()
            lane.player.shoot()
        })
    }
}

class Menu{
    constructor(x,y,w,h,color){
        this.x = x
        this.y = y
        this.w = w
        this.h = h
        this.color = color
        this.margin = 10
    }
    draw(){
        c.beginPath()
        c.rect(this.x+this.margin,this.y+this.margin,this.w-this.margin*2,this.h-this.margin)
        c.fillStyle = this.color
        c.fill()
    }
}

class Lane{
    constructor(x,y,w,h,color){
        this.x = x
        this.y = y
        this.w = w
        this.h = h
        this.color = color
        this.margin = 10
        this.speed = 2000
        this.radius = this.h/2-this.margin*4
        this.player = new Player(this.x+this.margin*2+this.radius,this.y+this.h/2+this.margin,this.radius,'blue')
    }
    draw(){
        c.beginPath()
        c.rect(this.x+this.margin,this.y+this.margin,this.w-this.margin*2,this.h-this.margin)
        c.strokeStyle = this.color
        c.stroke()
        this.player.draw()
    }
    showEnemy(){
        setInterval(()=>{
            enemies.push(new Enemy(this.x+this.w-this.margin*2-this.radius
                                , this.y+this.h-this.margin*2-this.radius
                                , this.radius-(Math.random()*10),'green',{ x:-1, y:0 }))
    
        },this.speed)
    }
}

class Player{
    constructor(x,y,radius,color){
        this.x = x
        this.y = y
        this.radius = radius
        this.color = color
        this.margin = 10
        this.speed = 1000
        this.level = Math.random()*10
    }
    draw(){
        c.beginPath()
        c.arc(this.x, this.y, this.radius,0, Math.PI*2, false)
        c.fillStyle = this.color
        c.fill()
        c.font = "11px Arial";
        c.strokeStyle = 'white';
        c.strokeText('Developer',this.x-this.radius+this.margin,this.y+this.margin)
    }
    shoot(){
        setInterval(()=>{
            const lvl = Math.random()*10*this.level    
            const shoot = new Shoot(this.x+this.radius+this.margin, this.y,5,'red',{x:lvl,y:0})
            shoots.push(shoot)
        },this.speed)
    }
}

class Shoot{
    constructor(x,y,radius,color,velocity){
        this.x = x
        this.y = y
        this.radius = radius
        this.color = color
        this.velocity = velocity
        this.margin = 10
    }
    draw(){
        c.beginPath()
        c.arc(this.x, this.y, this.radius,0, Math.PI*2, false)
        c.fillStyle = this.color
        c.fill()
    }
    update(){
        this.draw()
        this.x = this.x + this.velocity.x
        this.y = this.y + this.velocity.y
    }

}

class Enemy{
    constructor(x,y,radius,color,velocity){
        this.x = x
        this.y = y
        this.radius = radius
        this.color = color
        this.velocity = velocity
        this.margin = 10
        this.level = Math.random()*10
    }
    draw(){
        c.beginPath()
        c.arc(this.x, this.y, this.radius,0, Math.PI*2, false)
        c.fillStyle = this.color
        c.fill()
        c.font = "13px Arial";
        c.strokeStyle = 'yellow';
        c.strokeText('Business',this.x-this.radius+this.margin,this.y+this.margin)        
    }
    update(){
        this.draw()
        this.x = this.x + this.velocity.x
        this.y = this.y + this.velocity.y
    }
}

class Particle{
    constructor(x,y,radius,color,velocity){
        this.x = x
        this.y = y
        this.radius = radius
        this.color = color
        this.velocity = velocity
        this.margin = 10
        this.alpha = 1
    }
    draw(){
        c.save()
        c.globalAlpha = 0.1
        c.beginPath()
        c.arc(this.x, this.y, this.radius,0, Math.PI*2, false)
        c.fillStyle = this.color
        c.fill()
        c.restore()
    }
    update(){
        this.draw()
        this.x = this.x + this.velocity.x
        this.y = this.y + this.velocity.y
        this.alpha -= 0.01
    }
}

function animate(){
    animationId = requestAnimationFrame(animate)
    c.fillStyle = 'rgba(0,0,0,0.2)'
    c.fillRect(0,0,canvas.width,canvas.height)
    panel.draw()
    particles.forEach((particle,pIdx)=>{

    })
    shoots.forEach((s,sIdx)=>{
        s.update()
        if(s.x + s.radius < 0
        || s.x + s.radius >= panel.x + panel.w - panel.margin*2
        || s.x + s.radius >= canvas.width - panel.margin
        ){
            setTimeout(()=>{
                shoots.splice(sIdx,1)
            },0)
        }
    })
    enemies.forEach((e,eIdx)=>{
        e.update()
        shoots.forEach((s,sIdx)=>{
            const dist = Math.hypot(s.x - e.x,s.y - e.y)
            if(dist - e.radius - s.radius < 1){
                enemies.splice(eIdx,1)
                shoots.splice(sIdx,1)
            }
            panel.lanes.forEach(lane=>{
                const distEnd = Math.hypot(lane.player.x - e.x,lane.player.y - e.y)
                if(distEnd - e.radius - lane.player.radius < 1 ){
                  cancelAnimationFrame(animationId)
                }
            })
            
        })
    })
}

const enemies = []
const particles = []
const shoots = []
let animationId
const panel = new Panel(canvas.width,canvas.height)
panel.draw()
panel.show()
animate()
