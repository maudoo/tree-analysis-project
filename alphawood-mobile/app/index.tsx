import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
} from 'react-native';
import { useRouter } from 'expo-router';

export default function HomeScreen() {
  const router = useRouter();

  return (
      <View style={styles.container}>
        <View style={styles.hero}>
          <Text style={styles.logo}>🌳</Text>
          <Text style={styles.appName}>AlphaHawk</Text>
          <Text style={styles.tagline}>Explore. Discover. Protect.</Text>
        </View>

        <View style={styles.buttons}>
          <TouchableOpacity
              style={styles.loginButton}
              onPress={() => router.push('/(auth)/login')}>
            <Text style={styles.loginText}>Login</Text>
          </TouchableOpacity>

          <TouchableOpacity
              style={styles.signupButton}
              onPress={() => router.push('/(auth)/signup')}>
            <Text style={styles.signupText}>Sign Up</Text>
          </TouchableOpacity>
        </View>
      </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f9f9f9',
    justifyContent: 'space-between',
    padding: 24,
    paddingTop: 80,
    paddingBottom: 60,
  },
  hero: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 12,
  },
  logo: {
    fontSize: 100,
    marginBottom: 16,
  },
  appName: {
    fontSize: 40,
    fontWeight: '500',
    color: '#2D6A4F',
  },
  tagline: {
    fontSize: 16,
    color: '#888',
    letterSpacing: 1,
  },
  buttons: {
    gap: 12,
  },
  loginButton: {
    backgroundColor: '#2D6A4F',
    padding: 18,
    borderRadius: 12,
    alignItems: 'center',
  },
  loginText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '500',
  },
  signupButton: {
    backgroundColor: '#fff',
    padding: 18,
    borderRadius: 12,
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#2D6A4F',
  },
  signupText: {
    color: '#2D6A4F',
    fontSize: 18,
    fontWeight: '500',
  },
});