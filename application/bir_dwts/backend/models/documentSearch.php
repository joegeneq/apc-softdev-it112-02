<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Document;

/**
 * DocumentSearch represents the model behind the search form about `backend\models\Document`.
 */
class DocumentSearch extends Document
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'encoded_by', 'customer_id', 'company_agency_id', 'document_category'], 'integer'],
            [['document_tracking_number', 'document_description', 'document_priority', 'document_target_date', 'document_type', 'document_notes', 'document_image_front_page', 'create_time', 'update_time'], 'safe'],
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
        $query = Document::find();

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
            'encoded_by' => $this->encoded_by,
            'customer_id' => $this->customer_id,
            'company_agency_id' => $this->company_agency_id,
            'document_category' => $this->document_category,
            'document_target_date' => $this->document_target_date,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
        ]);

        $query->andFilterWhere(['like', 'document_tracking_number', $this->document_tracking_number])
            ->andFilterWhere(['like', 'document_description', $this->document_description])
            ->andFilterWhere(['like', 'document_priority', $this->document_priority])
            ->andFilterWhere(['like', 'document_type', $this->document_type])
            ->andFilterWhere(['like', 'document_notes', $this->document_notes])
            ->andFilterWhere(['like', 'document_image_front_page', $this->document_image_front_page]);

        return $dataProvider;
    }
}
