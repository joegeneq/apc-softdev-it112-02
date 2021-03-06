<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\DocumentWorkflow;

/**
 * DocumentWorkflowSearch represents the model behind the search form about `common\models\DocumentWorkflow`.
 */
class DocumentWorkflowSearch extends DocumentWorkflow
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id',], 'integer'],
            [['document_workflow_status_id','employee_id1', 'station_desk_id','employee_id','document_id', 'document_wokflow_comments', 'time_accepted', 'time_released', 'total_time_spent', 'create_time', 'update_time'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = DocumentWorkflow::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->joinWith('document');
        $query->joinWith('employee');
        $query->joinWith('stationDesk');

        $query->andFilterWhere([
            'id' => $this->id,
//            'document_id' => $this->document_id,
//            'employee_id' => $this->employee_id,
//            'station_desk_id' => $this->station_desk_id,
            'document_workflow_status_id' => $this->document_workflow_status_id,
            'time_accepted' => $this->time_accepted,
            'time_released' => $this->time_released,
            'total_time_spent' => $this->total_time_spent,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
//            'employee_id1' => $this->employee_id1,
        ]);

        $query->andFilterWhere(['like', 'document_wokflow_comments', $this->document_wokflow_comments])
             ->andFilterWhere(['like', 'employee_last_name', $this->employee_id]) 
             ->andFilterWhere(['like', 'station_desk.station_desk_name', $this->station_desk_id]) 
             ->andFilterWhere(['like', 'document.document_tracking_number', $this->document_id])
             ->andFilterWhere(['like', 'employee_last_name', $this->employee_id1]);

        return $dataProvider;
    }
}
