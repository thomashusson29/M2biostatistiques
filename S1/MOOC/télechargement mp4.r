##-----vidéo MOOC S1C2 Représentations graphiques------
htmltools::browsable(
  htmltools::tags$video(
    src = "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/57861137-0ed1-536d-8360-8a1f32db00b2/mp4/1585769733_720.mp4",
    type = "video/mp4",
    controls = NA,
    width = "700px"
  )
)



##----- Télécharger plusieurs vidéos depuis leurs URL -----

# Vecteur d'URLs
urls <- c(
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/774d41a3-59c1-5bf4-8c98-c0d4f4eef264/mp4/1585769717_720.mp4",
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/57861137-0ed1-536d-8360-8a1f32db00b2/mp4/1585769733_720.mp4",
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/d7391bed-fca1-5f3e-81af-b732f6c8020b/mp4/1585769742_720.mp4",
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/cab316d6-51f1-55b6-87af-456ee0459646/mp4/1585769747_720.mp4",
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/75f5c5d1-9980-5f8a-b671-aae14467aaa9/mp4/1585769755_720.mp4",
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/f54bebb0-5694-50dc-9206-d21a2c3a0e9b/mp4/1585769764_720.mp4",
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/22295464-8470-5f1c-bd8f-de5db1a2361c/mp4/1585769772_720.mp4",
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/3e0c9842-c3ad-5393-9acd-71a36c34258a/mp4/1585769780_720.mp4",
  "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/4b4a5f99-9f8e-5a56-88c8-0ed74871a567/mp4/1585769790_720.mp4"
)

# Noms de fichiers de sortie (automatiques ici, mais tu peux les changer)
fichiers <- basename(urls)

# Téléchargement en boucle
mapply(function(u, f) {
  download.file(url = u, destfile = f, mode = "wb")
}, urls, fichiers)

cat("Téléchargement terminé :", fichiers, "\n")