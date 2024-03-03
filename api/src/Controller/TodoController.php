<?php

namespace App\Controller;

use Doctrine\DBAL\Connection;
use Doctrine\DBAL\Schema\Schema;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/todos')]
class TodoController extends AbstractController
{
    #[Route('', name: 'show_todos')]
    public function show(Connection $connection): Response
    {

        $response = $this->get($connection);
        $todos = json_decode($response->getContent(), true);

        return $this->render('todo.html.twig', [
            'todos' => $todos,
        ]);
    }

    #[Route('/get', name: 'todos')]
    public function get(Connection $connection): JsonResponse
    {
        $sql = 'SELECT * FROM todo';
        $todos = $connection->fetchAllAssociative($sql);

        return $this->json($todos);
    }
}