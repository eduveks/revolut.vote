import React, { Component } from "react";
import ReactDOM from "react-dom";
import Input from "../presentational/Input";
import ListServices from "./ListServices";
import ChartBar from "./ChartBar";
import Table from "./Table";

class DashboardContainer extends Component {
    constructor() {
        super();
        this.state = {
            tableData: [],
            chartData: {}
        };
        this.input = React.createRef();
        this.result = React.createRef();
        this.handleChange = this.handleChange.bind(this);
    }
    handleChange(event) {
        if (isNaN(event.target.value)) {
            this.setState({ calc_hours: parseInt(this.state.calc_hours) });
            return;
        }
        let self = this;
        fetch('/services/samples/calc-hours.netuno?hours='+ event.target.value, {
            credentials: 'include'
        }).then((response) => {
            return response.json();
        }).then((json) => {
            self.result.current.innerText = json.date +' '+ json.time;
        });
        this.setState({ calc_hours: event.target.value });
    }

  // Chamada aos dados para a tabela e gráfico serem criadas
  componentWillMount() {
    this.getRecords();
  }

  // Criação da chamada ao serviço registos.netuno
  getRecords() {

    let that = this;
    fetch('/services/samples/registos.netuno', {
      credentials: 'include'
    }).then((response) => {
      return response.json();
    }).then((json) => {
      if (!json.length) {
        return;
      } else {
        // Adição dos dados à tabela e gráfico
        that.setState({ tableData: json, chartData: json });
      }
    });
  }

  // Chamada ao serviço para atualizar os dados a cada 30 segundos
  componentDidMount() {
    this.interval = setInterval(() => this.getRecords(), 30000);
  }

  // Limpeza do contador para a próxima chamada em 30 segundos
  componentWillUnmount() {
    clearInterval(this.interval);
  }

    render() {
        const { calc_hours } = this.state;
        return (
            <div>
                <ListServices />
                <div className="row">
                    <div className="col-lg-6">
                    <div className="panel panel-default">
                        <div className="panel-heading panel-registos">
                        <h3 className="panel-title">Tabela</h3>
                        </div>
                        <div className="panel-body">

                        <Table tableData={this.state.tableData} />

                        </div>
                    </div>
                    </div>
                    <div className="col-lg-6">
                    <div className="panel panel-default">
                        <div className="panel-heading panel-registos">
                        <h3 className="panel-title">Gr&aacute;fico</h3>
                        </div>
                        <div className="panel-body">

                        <ChartBar chartData={this.state.chartData} displayLegend="false" legendPosition="top" />

                        </div>
                    </div>
                    </div>
                </div>
            </div>

        );
    }
}
export default DashboardContainer;

const wrapper = document.getElementById("app-dashboard");
wrapper ? ReactDOM.render(<DashboardContainer />, wrapper) : false;
