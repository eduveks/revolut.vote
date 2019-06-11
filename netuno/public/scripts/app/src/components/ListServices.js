import React, { Component } from 'react';

class ListServices extends Component {

    constructor() {
      super();
        this.state = {
            listServicesData: {}
        }
    }

    render() {
      return (
      <div>
        <div className="list-services-header">
          <i className="fa fa-thumb-tack"></i> Exemplos de Serviços
        </div>
        <ul className="list-group">
          <div className="row">
            <div className="col-md-3">
              <li className="list-group-item">
                <a href="/services/samples/calc-hours.netuno?hours=100" target="_blank">Calcular horas no futuro</a>
                <div className="hidden-description-hover">
                  Você pode alterar o número de horas no final da URL, tente.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/date-format.netuno" target="_blank">Formatar Data e Hora</a>
                <div className="hidden-description-hover">
                  Ao trabalhar com datas e horas é preciso realizar a conversão para a string e vice-versa, aqui vai alguns exemplos de como fazer.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/export-excel.netuno" target="_blank">Exportar para Excel</a>
                <div className="hidden-description-hover">
                  Exemplo de como é possível exportar os seus dados para folha Excel.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/export-pdf.netuno" target="_blank">Exportar para PDF</a>
                <div className="hidden-description-hover">
                  Exemplo de como colocar em formato PDF a sua informação.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/group.netuno" target="_blank">Grupo</a>
                <div className="hidden-description-hover">
                  Apresenta a informação do grupo do utilizador logado.
                </div>
              </li>
            </div>
            <div className="col-md-3">
              <li className="list-group-item">
                <a href="/services/samples/infinite-loop.netuno" target="_blank">LOOP Infinito</a>
                <div className="hidden-description-hover">
                  Aiii meu deuuusss! Não se preocupe! Relaxa...
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/mail-send.netuno" target="_blank">Enviar Mail</a>
                <div className="hidden-description-hover">
                  Exemplo de como enviar e-mail utilizando uma conta Google/GMail, troque os <b>*****</b> pelas informações da respectivas da conta.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/print-lines.netuno" target="_blank">Retorna Linhas como Texto</a>
                <div className="hidden-description-hover">
                  Pode experimentar.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/print-template.netuno?param1=Ok" target="_blank">Retorna conteúdo templates</a>
                <div className="hidden-description-hover">
                  Quando precisa processar HTML e manter o código simples e organizado.
                  Verifique o conteúdo da pasta public/templates/samples.
                  Ou experimente:
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/query-parameter.netuno?id=1&name=atriz" target="_blank">Query Parameter</a>
                <div className="hidden-description-hover">
                  Este exemplo retorna resultados <b>Json</b>. Faça o replace do <b>trbalhador</b> pelo nome
                  correto da sua tabela/formulário, e verifique se você tem a coluna/campo
                  [ nome ] criada com pelo menos um registo com o id 1 e que contenha no nome
                  a palavra atriz. Basta abrir o url acima.
                </div>
              </li>
            </div>
            <div className="col-md-3">
              <li className="list-group-item">
                <a href="/services/samples/query-interaction.netuno?id=1" target="_blank">Query Interaction</a>
                <div className="hidden-description-hover">
                  Este exemplo retorna resultados <b>Json</b>. Faça o replace do <b>YOUR_FORM_NAME</b> pelo nome
                  correto da sua tabela/formulário, e verifique se você tem a coluna/campo
                  [ code ] criado com pelo menos um registo com o id 1 e o valor do code
                  como one. Depois basta abrir o url acima.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/query-result.netuno" target="_blank">Query Result</a>
                <div className="hidden-description-hover">
                  Aqui um exemplo! Apenas faça o replace do <b>YOUR_FORM_NAME</b> pelo nome correto da sua tabela/formulário.
                  Depois basta abrir o url acima.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/uid.netuno" target="_blank">uid</a>
                  <div className="hidden-description-hover">
                    Gera um uid/Guid, uma string aleatório de identificação única.
                  </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/user.netuno" target="_blank">User</a>
                <div className="hidden-description-hover">
                  Apresenta a informação do utilizador logado.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/remote-delete-json.netuno" target="_blank">Remote Delete Json</a>
                <div className="hidden-description-hover">
                  DELETE é um pedido/request para eliminar uma entidade especifica do servidor.
                </div>
              </li>
            </div>
            <div className="col-md-3">
              <li className="list-group-item">
                <a href="/services/samples/remote-patch-json.netuno" target="_blank">Remote Patch Json</a>
                <div className="hidden-description-hover">
                  Patch é um formaot standard web para descrever mudanças num documento JSON.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/remote-post-json.netuno" target="_blank">Remote Post json</a>
                <div className="hidden-description-hover">
                  POST é um pedido/request para criar uma nova entidade. O conteúdo dessa entidade
                  deve ser incluido no corpo desse mesmo pedido.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/remote-put-json.netuno" target="_blank">Remote Put Json</a>
                <div className="hidden-description-hover">
                  PUT é semelhante ao POST, com a diferença de que deve criar uma nova entidade se nao existir.
                  Caso exista passa á modificação/atualização da mesma.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/remote-get-json.netuno" target="_blank">Remote Get Json</a>
                <div className="hidden-description-hover">
                  É muito simples chamar outros serviços como REST, suporta todos os métodos HTTP.
                  Depois basta abrir o url acima.
                </div>
              </li>
              <li className="list-group-item">
                <a href="/services/samples/remote-mailjet-sms.netuno" target="_blank">Remote Mailjet SMS</a>
                <div className="hidden-description-hover">
                  Vamos enviar um SMS, configure o <b>YOUR_TOKEN</b> e o <b>YOUR_INTERNATIONAL _PHONE_NUMBER</b>.
                  Depois basta abrir o url acima.
                </div>
              </li>
            </div>
          </div>
        </ul>
      </div>
      );
    }
}

export default ListServices;
