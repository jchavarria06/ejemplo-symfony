<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 */
class User implements UserInterface
{
    const REGISTRO_EXITOSO = 'se ha registrado exitosamente';
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $username;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;
    
    /**
    *@ORM\Column(type="boolean" , nullable=true)
    */
    
    private $baneado;
    
    /**
    *@ORM\Column(type="string")
    */
    
    private $nombre;
    
    /**
    * @ORM\OneToMany(targetEntity="App\Entity\Comentario",mappedBy="user")
    */
    private $comentario; 
    
    /**
    * @ORM\OneToMany(targetEntity="App\Entity\Posts",mappedBy="user")
    */
    private $posts;
    
    /**
    * @ORM\OneToMany(targetEntity="App\Entity\Profesion",mappedBy="user")
    */
    private $profesion;
        
    public function _construct(){
        $this->baneado = false;
        $this->roles = ['ROLE_USER'];
    }
    
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->username;
    }

    public function setUsername(string $username): self
    {
        $this->username = $username;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }
    
    /**
    * @return mixed
    */
    
    public function getBaneado() 
    {
        return $this->baneado;
    }
    
    /**
    * @param mixed $baneado
    */

    public function setBaneado($baneado): void
    {
        $this->baneado = $baneado;

    }
    
    /**
    * @return mixed
    */
    
    public function getNombre() 
    {
        return $this->nombre;
    }
    
    /**
    * @param mixed $nombre
    */

    public function setNombre($nombre): void
    {
        $this->nombre = $nombre;

    }
}
