# Quel - gerenciador de pacotes

> Instalador de pacotes para programas pré-compilados.

 
### Utilizado oficialmente na distribuição Linux Quieux
* [Quieux](https://quieux.github.io/)



### Requisitos :star:
* **squashfs** >= 2.x <br/>
* **wget** >= 1.24.5 <br/>
----

## Instalação 
**Faça o download, conceda permissões e execute o script**
```bash
git clone https://github.com/quieux/quel.git
cd quel
chmod +x install.sh
sudo ./install.sh
```

### Modo de usar:
**Digite o comando no terminal:**

Esse comando instala pacotes .quel localmente.

```bash
sudo quel -i
```

Esse comando remove programas instalados no seu computador

```bash
sudo quel -r
```
Esse comando atualiza a lista de repositórios.

```bash
sudo quel -u
```

Esse comando busca o pacote no repositorio e realiza o download para instalação.

```bash
sudo quel -d
```

[Bash4.4.18-shield]: https://img.shields.io/badge/Bash-4.4.18%2B-brightgreen.svg "Bash 4.4.18 Ou superior"
