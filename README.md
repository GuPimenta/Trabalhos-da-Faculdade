using System;
using System.Collections.Generic;

class Program
{
    // Definindo uma classe para representar uma pessoa
    class Pessoa
    {
        public string Nome { get; set; }
        public int Idade { get; set; }
        public string Email { get; set; }
    }

    static List<Pessoa> listaDePessoas = new List<Pessoa>();

    static void Main(string[] args)
    {
        bool sair = false;

        while (!sair)
        {
            Console.WriteLine("\nMenu:");
            Console.WriteLine("1. Adicionar");
            Console.WriteLine("2. Remover");
            Console.WriteLine("3. Alterar");
            Console.WriteLine("4. Visualizar cadastros");
            Console.WriteLine("5. Sair");

            Console.Write("Escolha uma opção: ");
            string opcao = Console.ReadLine();

            switch (opcao)
            {
                case "1":
                    AdicionarPessoa();
                    break;
                case "2":
                    RemoverPessoa();
                    break;
                case "3":
                    AlterarPessoa();
                    break;
                case "4":
                    VisualizarCadastros();
                    break;
                case "5":
                    sair = true;
                    break;
                default:
                    Console.WriteLine("Opção inválida.");
                    break;
            }
        }
    }

    static void AdicionarPessoa()
    {
        Console.WriteLine("\nAdicionar Pessoa:");

        Pessoa pessoa = new Pessoa();

        Console.Write("Nome: ");
        pessoa.Nome = Console.ReadLine();

        Console.Write("Idade: ");
        pessoa.Idade = int.Parse(Console.ReadLine());

        Console.Write("Email: ");
        pessoa.Email = Console.ReadLine();

        listaDePessoas.Add(pessoa);
        Console.WriteLine("Pessoa adicionada com sucesso.");
    }

    static void RemoverPessoa()
    {
        Console.WriteLine("\nRemover Pessoa:");
        Console.Write("Índice da pessoa a ser removida: ");
        int indice = int.Parse(Console.ReadLine());

        if (indice >= 0 && indice < listaDePessoas.Count)
        {
            listaDePessoas.RemoveAt(indice);
            Console.WriteLine("Pessoa removida com sucesso.");
        }
        else
        {
            Console.WriteLine("Índice inválido.");
        }
    }

    static void AlterarPessoa()
    {
        Console.WriteLine("\nAlterar Pessoa:");
        Console.Write("Índice da pessoa a ser alterada: ");
        int indice = int.Parse(Console.ReadLine());

        if (indice >= 0 && indice < listaDePessoas.Count)
        {
            Pessoa pessoa = listaDePessoas[indice];

            Console.Write("Novo nome: ");
            pessoa.Nome = Console.ReadLine();

            Console.Write("Nova idade: ");
            pessoa.Idade = int.Parse(Console.ReadLine());

            Console.Write("Novo email: ");
            pessoa.Email = Console.ReadLine();

            listaDePessoas[indice] = pessoa;
            Console.WriteLine("Pessoa alterada com sucesso.");
        }
        else
        {
            Console.WriteLine("Índice inválido.");
        }
    }

    static void VisualizarCadastros()
    {
        Console.WriteLine("\nLista de Cadastros:");
        for (int i = 0; i < listaDePessoas.Count; i++)
        {
            Console.WriteLine($"[{i}] Nome: {listaDePessoas[i].Nome}, Idade: {listaDePessoas[i].Idade}, Email: {listaDePessoas[i].Email}");
        }
    }
}
