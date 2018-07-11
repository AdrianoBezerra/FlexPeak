-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11-Jul-2018 às 17:31
-- Versão do servidor: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flexpeak2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `id_aluno` int(11) NOT NULL,
  `alu_nome` varchar(30) NOT NULL,
  `alu_dtNascimento` date NOT NULL,
  `alu_logradouro` varchar(50) NOT NULL,
  `alu_numero` int(11) NOT NULL,
  `alu_bairro` varchar(30) NOT NULL,
  `alu_cidade` varchar(30) NOT NULL,
  `alu_estado` varchar(30) NOT NULL,
  `alu_dtCriacao` date NOT NULL,
  `alu_cep` int(11) NOT NULL,
  `alu_id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`id_aluno`, `alu_nome`, `alu_dtNascimento`, `alu_logradouro`, `alu_numero`, `alu_bairro`, `alu_cidade`, `alu_estado`, `alu_dtCriacao`, `alu_cep`, `alu_id_curso`) VALUES
(1, 'adriano22', '2018-07-10', 'Rua Apial', 55, 'Cidade Nova', 'Manaus', 'AM', '2018-07-10', 69090460, 2),
(2, 'livia', '2017-04-14', 'Rua Apial', 55, 'Cidade Nova', 'Manaus', 'AM', '2018-07-10', 69090460, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `cur_nome` varchar(30) NOT NULL,
  `cur_dtCriacao` date NOT NULL,
  `cur_id_professor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id_curso`, `cur_nome`, `cur_dtCriacao`, `cur_id_professor`) VALUES
(1, 'Informatica', '2018-07-10', 1),
(2, 'Matematica', '2018-07-10', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `id_professor` int(11) NOT NULL,
  `pro_nome` varchar(30) NOT NULL,
  `pro_dtNascimento` date NOT NULL,
  `pro_dtCriacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`id_professor`, `pro_nome`, `pro_dtNascimento`, `pro_dtCriacao`) VALUES
(1, 'Adriano', '1992-09-10', '2018-07-10'),
(2, 'Shirley', '1991-08-29', '2018-07-10'),
(3, 'Livia', '2017-04-14', '2018-07-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id_aluno`),
  ADD KEY `fk_aluno` (`alu_id_curso`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `fk_curso` (`cur_id_professor`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id_professor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_aluno` FOREIGN KEY (`alu_id_curso`) REFERENCES `curso` (`id_curso`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso` FOREIGN KEY (`cur_id_professor`) REFERENCES `professor` (`id_professor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
