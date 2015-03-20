<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\DocumentWorkflow;

/**
 * DocumentWorkflowSearch represents the model behind the search form about `backend\models\DocumentWorkflow`.
 */
class DocumentWorkflowSearch extends DocumentWorkflow
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'document_id', 'employee_id', 'station_desk_id', 'next_receiver'], 'integer'],
            [['document_wokflow_comments', 'document_wokflow_status', 'time_accepted', 'time_released', 'total_time_spent', 'create_time', 'update_time'], 'safe'],
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

        $query->andFilterWhere([
            'id' => $this->id,
            'document_id' => $this->document_id,
            'employee_id' => $this->employee_id,
            'station_desk_id' => $this->station_desk_id,
            'time_accepted' => $this->time_accepted,
            'time_released' => $this->time_released,
            'total_time_spent' => $this->total_time_spent,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
            'next_receiver' => $this->next_receiver,
        ]);

        $query->andFilterWhere(['like', 'document_wokflow_comments', $this->document_wokflow_comments])
            ->andFilterWhere(['like', 'document_wokflow_status', $this->document_wokflow_status]);

        return $dataProvider;
    }
}
