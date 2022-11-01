describe('Criando cenário de teste para o repositorio das aulas de S206-L1', () => {
  it('Caso de teste: Verificando o nome do usuário do repositório', () => {
    cy.visit(url)
  })
  
  it('Caso de teste: Verificando a URL para clonar o repositório', () => {
    cy.visit(url)
    cy.get('.btn-primary').click()
    cy.get(':nth-child(2) > .input-group > .form-control').should('have.value', 'https://github.com/FabioFiorita/S206-Lab.git')
  })

})

let url = 'https://github.com/FabioFiorita/S206-Lab';