import Kitura
import KituraStencil    //      For Stencil - HTML template
import LoggerAPI
import HeliumLogger

HeliumLogger.use(.info)
let router = Router()
let port = 8090


router.setDefault(templateEngine: StencilTemplateEngine())
router.all("/static", middleware: StaticFileServer())


router.get("/") {
    request, response, next in
    defer { next() }
    try response.render("home", context: [:])
}
router.get("/about") {
    request, response, next in
    defer { next() }
    try response.render("about", context: [:])
}
router.get("/work") {
    request, response, next in
    defer { next() }
    try response.render("work", context: [:])
}

router.get("/contact") {
    request, response, next in
    defer { next() }
    try response.render("contact", context: [:])
}
router.get("/workwithus") {
    request, response, next in
    defer { next() }
    try response.render("workwithus", context: [:])
}

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()


