import { Pool } from 'pg';
import { keys} from './keys'

const pgClient = new Pool({
  user: keys.pgUser,
  host: keys.pgHost,
  database: keys.pgDatabase,
  password: keys.pgPassword,
  port: keys.pgPort && parseInt(keys.pgPort) || 0
});

export default pgClient