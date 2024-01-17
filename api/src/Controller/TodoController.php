<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class TodoController extends AbstractController
{
    #[Route('/todos', name: 'todos')]
    public function get(): Response
    {
        return $this->json([
            'todo' => 'Récupérer les todos de la base postgres'
        ]);
    }
}