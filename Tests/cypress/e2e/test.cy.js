/// <reference types="cypress" />

describe("Criando cenário de teste para o site globalsqa", () => {
  it("Caso de teste: Registrando um usuário no site com sucesso", () => {
    cy.visit('https://globalsqa.com/angularJs-protractor/registration-login-example/#/login');
    cy.get('.btn-link').click();
    cy.get('#firstName').type('Fabio');
    cy.get('#Text1').type('Fiorita')
    cy.get('#username').type('fabiofiorita');
    cy.get('#password').type('123456');
    cy.get('.btn-primary').click();
    cy.get('.ng-binding').should('contain.text', 'Registration successful');
  });

  it("Caso de teste: Registrando um usuário no site com falha", () => {
    cy.visit('https://globalsqa.com/angularJs-protractor/registration-login-example/#/register');
    cy.get('#firstName').type('Fabio');
    cy.get('#Text1').type('Fiorita')
    cy.get('#username').type('fabiofiorita');
    cy.get('#password').type('123456');
    cy.get('#password').clear();
    cy.get('.has-error > .help-block').should('have.text', 'Password is required');
    cy.get('.btn-primary').should('be.disabled');
  });

  it("Caso de teste: Realizando login com sucesso", () => {
    let userInfo = criarUsuario();
    cy.get('#username').type(userInfo.usuario)
    cy.get('#password').type(userInfo.senha);
    cy.get('.btn-primary').click()
    cy.get('h1.ng-binding').should('contain.text', userInfo.usuario);
  });

});

  let criarUsuario = () => {
    let horas = new Date().getHours().toString();
    let minutos = new Date().getMinutes().toString();
    let segundos = new Date().getSeconds().toString();
    let usuario = horas + minutos + segundos + "usuario";
    let senha = horas + minutos + segundos + "senha";
    let userInfo = {
      usuario,
      senha
    }

    cy.visit('https://globalsqa.com/angularJs-protractor/registration-login-example/#/login');
    cy.get('.btn-link').click();
    cy.get('#firstName').type(userInfo.usuario);
    cy.get('#Text1').type(userInfo.usuario)
    cy.get('#username').type(userInfo.usuario);
    cy.get('#password').type(userInfo.senha);
    cy.get('.btn-primary').click();
    cy.get('.ng-binding').should('contain.text', 'Registration successful');

    return userInfo;

  }