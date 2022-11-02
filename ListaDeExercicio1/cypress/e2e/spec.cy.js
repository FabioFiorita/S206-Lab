describe("Criando cenário de teste para o site sofifa", () => {
  beforeEach(() => {
    cy.visit(url);
  });

  it("Caso de teste: Pesquisando um jogador válido", () => {
    cy.get("#id_name").click().type("Antony");
    cy.get('[type="submit"]').click();
    cy.get(
      '[data-playerid="255475"] > [data-title="Name"] > .link-player'
    ).should("contain.text", "Antony");
  });

  it("Caso de teste: Pesquisando um jogador inválido", () => {
    cy.get("#id_name").click().type("Calleri");
    cy.get('[type="submit"]').click();
    cy.get(".pt-4").should(
      "have.text",
      "There are no results based on your search parameters."
    );
  });

  it("Caso de teste: Pesquisando a lista das jogadoras femininas do fifa", () => {
    cy.get("#id_gender_1").click();
    cy.get('[type="submit"]').click();
    cy.get(
      '[data-playerid="227203"] > [data-title="Name"] > .link-player'
    ).should("contain.text", "Alexia Putellas");
  });

  it("Caso de teste: Testando o botão Teams", () => {
    cy.get(".mr-auto > :nth-child(2) > .nav-link").click();
    cy.get(':nth-child(4) > [data-title="Name"] > .link-team').should(
      "contain.text",
      "Real Madrid"
    );
  });

  it("Caso de teste: Testando o botão Rankings", () => {
    cy.get(".mr-auto > :nth-child(3) > .nav-link").click();
    cy.get(".mb-3").should("have.text", "Top Players in FIFA 22 Career Mode");
  });

  it("Caso de teste: Testando o botão Community", () => {
    cy.get(".mr-auto > :nth-child(5) > .nav-link").click();
    cy.get(".container > :nth-child(1) > .col-12 > :nth-child(1)").should(
      "contain.text",
      "Community is the latest addition to FIFA Index."
    );
  });
});

let url = "https://www.fifaindex.com/players/";
