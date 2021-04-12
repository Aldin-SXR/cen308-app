<?php

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    protected $client;

    protected function setUp(): void
    {
        $this->client = new GuzzleHttp\Client([
            'base_uri' => getenv('HEROKU') ? 
                'https://cen308-test.herokuapp.com/api/' : 'http://localhost/cen308-app/api/'
        ]);
    }

    public function testStatusRoute()
    {
        $response = $this->client->get('status');

        $this->assertEquals(200, $response->getStatusCode());

        $data = json_decode($response->getBody(), true);

        $this->assertArrayHasKey('status', $data);
        $this->assertEquals('online', $data['status']);
    }
}
