<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\DocumentWorkflowStatus;

/**
 * DocumentWorkflowStatusSearch represents the model behind the search form about `common\models\DocumentWorkflowStatus`.
 */
class DocumentWorkflowStatusSearch extends DocumentWorkflowStatus
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['document_workflow_status_name', 'document_workflow_status_description', 'create_time', 'update_time'], 'safe'],
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
        $query = DocumentWorkflowStatus::find();

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
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
        ]);

        $query->andFilterWhere(['like', 'document_workflow_status_name', $this->document_workflow_status_name])
            ->andFilterWhere(['like', 'document_workflow_status_description', $this->document_workflow_status_description]);

        return $dataProvider;
    }
}
