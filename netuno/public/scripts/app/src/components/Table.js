import React, { Component } from 'react';

class Table extends Component {

    constructor(props) {
        super(props);
        this.state = {
            tableData: []
        }
    }

    static getDerivedStateFromProps(nextProps, prevState){
    if (nextProps.tableData) {
      return {
        tableData: nextProps.tableData
      }
    }
    return null;
  }

    render() {

      const tableFinalData = this.state.tableData.map((record, i) =>
        <tr key={i}>
          <td>{record.trabalhador}</td><td>{record.trabalhadorHoras}</td>
        </tr>
      );

      return (
        <table className="registo-table">
          <tbody>
            <tr>
              <th>Trabalhador</th>
              <th>Total</th>
            </tr>
            {tableFinalData}
          </tbody>
        </table>
      )
    }
}

export default Table;
