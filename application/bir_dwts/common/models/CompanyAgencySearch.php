<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\CompanyAgency;

/**
 * CompanyAgencySearch represents the model behind the search form about `common\models\CompanyAgency`.
 */
class CompanyAgencySearch extends CompanyAgency
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['company_agency_code', 'company_agency_name', 'company_agency_description', 'create_time', 'update_time'], 'safe'],
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
        $query = CompanyAgency::find();

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

        $query->andFilterWhere(['like', 'company_agency_code', $this->company_agency_code])
            ->andFilterWhere(['like', 'company_agency_name', $this->company_agency_name])
            ->andFilterWhere(['like', 'company_agency_description', $this->company_agency_description]);

        return $dataProvider;
    }
}
