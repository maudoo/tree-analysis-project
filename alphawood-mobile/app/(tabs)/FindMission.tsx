import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';
import { useRouter } from 'expo-router';

export default function FindMission() {
    const router = useRouter();

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Missions</Text>
            <Text style={styles.subtitle}>Ready for a challenge?</Text>

            <TouchableOpacity
                style={styles.button}
                onPress={() => router.push('/missions/assign')}>
                <Text style={styles.buttonText}>Find Mission</Text>
            </TouchableOpacity>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#f9f9f9',
        padding: 24,
    },
    title: {
        fontSize: 32,
        fontWeight: '500',
        color: '#2D6A4F',
        marginBottom: 8,
    },
    subtitle: {
        fontSize: 16,
        color: '#888',
        marginBottom: 48,
    },
    button: {
        backgroundColor: '#2D6A4F',
        paddingHorizontal: 40,
        paddingVertical: 16,
        borderRadius: 12,
    },
    buttonText: {
        color: '#fff',
        fontSize: 18,
        fontWeight: '500',
    },
});