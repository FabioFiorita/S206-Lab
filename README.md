# S206-Lab
Códigos dos exercícios do laboratório da matéria de Qualidade de Software

## Como inicializar o cypress
Utilizando npx:
```bash
npx cypress open
```

Utilizando yarn:
```bash
yarn run cypress open
```

## Como executar os testes do cypress com gerador de relatório
Utilizando npx:
```bash
npx cypress
```

Utilizando yarn:
```bash
yarn cypress run
```

## Como executar os testes do Karate com gerador de relatório
Executar um teste a partir do Runner ou suíte:
```bash
mvn test –Dtest=StarWarsRunner
```

Executar testes separados por tags:
```bash
mvn test -Dkarate.options="--tags @tag”
```

Para ignorar alguma tag:
```bash
mvn test -Dkarate.options="--tags ~@tag" 
```

Todas as tags podem ser configuradas na classe da suíte de testes.
