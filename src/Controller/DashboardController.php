<?php

namespace App\Controller;
use App\Entity\Posts;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractController
{
    /**
     * @Route("/dashboard", name="dashboard")
     */
    public function index()
    {
        $em=$this->getDoctrine()->getManager();
        $posts = $em -> getRepository(Posts::class)-> findAll();
        $post = $em -> getRepository(Posts::class)-> findBy(['likes'=>null]);
        return $this->render('dashboard/index.html.twig', [
            'posts' => $posts,
            'post' => $post
        ]);
    }
    /*public function borrarAction($id) {
 
 
        //Entity Manager
        $em = $this->getDoctrine()->getEntityManager();
        $posts = $em->getRepository(Posts::class);
 
        $post = $posts->find($id);
        $em->remove($post);
        $flush=$em->flush();
 
        if ($flush == null) {
            echo "Post se ha borrado correctamente";
        } else {
            echo "El post no se ha borrado";
        }
 
 
        die();
    }
*/
    /*public function actualizarAction($id, $title, $description, $content) {
 
 
        //Entity Manager
        $em = $this->getDoctrine()->getEntityManager();
        $posts = $em->getRepository("PruebasEjemploBundle:Posts");
 
 
        $post = $posts->find($id);
        $post->setTitle($title);
        $post->setDescription($description);
        $post->setContent($content);
 
        //Persistimos en el objeto
        $em->persist($post);
 
        //Insertarmos en la base de datos
        $flush = $em->flush();
 
        if ($flush == null) {
            echo "Post actualizado correctamente";
        } else {
            echo "El post no se ha actualizado";
        }
 
      
        die();
    }
*/
}
