describe('Criando cenário de teste para o site XYZ Bank', () => {
  beforeEach(() => {
    cy.visit(url);
  });

  it('Caso de teste: Login com sucesso', () => {
    cy.get('.borderM > :nth-child(1) > .btn').click();
    cy.get('#userSelect').select('Harry Potter');
    cy.get('form.ng-valid > .btn').click();
    cy.get('.fontBig').should('contain.text', 'Harry Potter');
  });

  it('Caso de teste: Logout com sucesso', () => {
    login();
    cy.get('.logout').click();
    cy.get('.mainHeading').should('contain.text', 'XYZ Bank');
  });

  it('Caso de teste: Retirar dinheiro sem saldo suficiente', () => {
    login();
    cy.get('[ng-class="btnClass3"]').click();
    cy.get('.form-control').type('1000');
    cy.get('form.ng-dirty > .btn').click();
    cy.get('.error').should('contain.text', 'Transaction Failed. You can not withdraw amount more than the balance.');
  });
})

let url = 'https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login';

function login() {
  cy.get('.borderM > :nth-child(1) > .btn').click();
    cy.get('#userSelect').select('Harry Potter');
    cy.get('form.ng-valid > .btn').click();
}