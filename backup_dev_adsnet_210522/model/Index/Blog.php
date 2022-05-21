<?php

namespace Model\Index;

class Blog extends \System\Db
{
    public function listCategory()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM blog_category WHERE status = "Published" AND is_deleted = 0');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getCategoryBySlug($slug)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM blog_category WHERE slug = :slug AND status = "Published" AND is_deleted = 0');
        $stmt->bindValue(':slug', $slug);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listFavouriteArticles($limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.title AS cate_title, b.slug AS cate_slug FROM blog_article a INNER JOIN blog_category b ON a.category_id = b.id WHERE a.is_favourite = 1 AND a.status = "Published" AND a.is_deleted = 0 ORDER BY a.id DESC LIMIT :limit');
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listMostReadArticles($limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.title AS cate_title, b.slug AS cate_slug FROM blog_article a INNER JOIN blog_category b ON a.category_id = b.id WHERE a.is_favourite = 1 AND a.status = "Published" AND a.is_deleted = 0 ORDER BY a.id DESC LIMIT :limit');
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listRecentArticles($limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.title AS cate_title, b.slug AS cate_slug FROM blog_article a INNER JOIN blog_category b ON a.category_id = b.id WHERE a.status = "Published" AND a.is_deleted = 0 ORDER BY RAND() DESC LIMIT :limit');
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listArticles($limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.title AS cate_title, b.slug AS cate_slug FROM blog_article a INNER JOIN blog_category b ON a.category_id = b.id WHERE a.status = "Published" AND a.is_deleted = 0 ORDER BY a.id DESC LIMIT :limit');
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listOtherArticles($id, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.title AS cate_title, b.slug AS cate_slug FROM blog_article a INNER JOIN blog_category b ON a.category_id = b.id WHERE a.id <> :id AND a.status = "Published" AND a.is_deleted = 0 ORDER BY RAND() DESC LIMIT :limit');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getArticleBySlug($article_slug)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.title AS cate_title, b.slug AS cate_slug FROM blog_article a INNER JOIN blog_category b ON a.category_id = b.id WHERE a.slug = :slug AND a.status = "Published" AND a.is_deleted = 0');
        $stmt->bindValue(':slug', $article_slug);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function getArticleById($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.title AS cate_title, b.slug AS cate_slug FROM blog_article a INNER JOIN blog_category b ON a.category_id = b.id WHERE a.id = :id AND a.is_deleted = 0');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listArticleByCategorySlug($category_slug, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.title AS cate_title, b.slug AS cate_slug FROM blog_article a INNER JOIN blog_category b ON a.category_id = b.id WHERE b.slug = :category_slug AND a.status = "Published" AND a.is_deleted = 0 ORDER BY a.id DESC LIMIT :limit');
        $stmt->bindValue(':category_slug', $category_slug);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listTags($limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM blog_tag WHERE article_id IS NOT NULL ORDER BY id DESC LIMIT :limit');
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getTagBySlug($slug)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM blog_tag WHERE slug = :slug');
        $stmt->bindValue(':slug', $slug);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function checkArticle($article_slug, $category_id)
    {
        $stmt = $this->pdo->prepare('SELECT slug, category_id FROM blog_article WHERE slug = :article_slug AND category_id = :category_id AND is_deleted = 0');
        $stmt->bindValue(':article_slug', $article_slug);
        $stmt->bindValue(':category_id', (int) $category_id, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->rowCount();
    }
}