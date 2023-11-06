import { useMUD } from "./MUDContext";
import { Hex } from "viem";
import { useState, useEffect } from "react";

// Define the type for a player
type PlayerType = {
  entity: `0x${string}`;
  playNum: number; // Assuming playNum is a number, adjust the type if needed
};

function Match({ matchEntity }: { matchEntity: Hex }) {
  // fetch table data from network
  const {
    network: { tables, useStore },
  } = useMUD();

  // store index
  const index = useStore((state) =>
    state.getValue(tables.MatchIndex, { matchEntity })
  );

  return (
    <div className="text-xl">
      Match #{index ? index.matchIndex : matchEntity} ({matchEntity})
    </div>
  );
}

function MatchSelector({ onMatchSelect }: { onMatchSelect: (matchIndex: number) => void }) {
  const {
    network: { tables, useStore },
  } = useMUD();

  // Get match indices for the dropdown, ensuring we get the matchIndex from MatchIndex table
  const matchIndices = useStore((state) =>
    Object.values(state.getRecords(tables.MatchIndex)).map(record => record.value.matchIndex)
  ).sort((a, b) => a - b); // Sort match indices if needed

  return (
    <select onChange={(e) => onMatchSelect(parseInt(e.target.value, 10))} defaultValue="">
      <option value="">Select a match</option>
      {matchIndices.map((matchIndex) => (
        <option key={matchIndex} value={matchIndex}>
          Match #{matchIndex}
        </option>
      ))}
    </select>
  );
}

function PlayersList({ matchEntity }: { matchEntity: Hex }) {
  const { network: { tables, useStore } } = useMUD();

  // Explicitly define the type for players state
  const [players, setPlayers] = useState<PlayerType[]>([]);

  useEffect(() => {
    // Function to fetch players
    const fetchPlayers = async () => {
      const playerRecords = useStore((state) =>
        Object.entries(state.getRecords(tables.Player))
          .filter(([_, record]) => record.key.matchEntity === matchEntity)
          .map(([_, record]) => ({
            entity: record.key.entity,
            playNum: record.value as unknown as number // Cast to number if needed
          }))
      );

      setPlayers(playerRecords);
    };

    fetchPlayers();
  }, [matchEntity, tables.Player, useStore]);

  // Render the player list
  return (
    <div>
      {players.length > 0 ? (
        <ul>
          {players.map((player, index) => (
            <li key={index}>
              Player: {player.entity}, playNum: {player.playNum}
            </li>
          ))}
        </ul>
      ) : (
        <p>No players found for this match.</p>
      )}
    </div>
  );
}

export function App() {
  // fetch table data from network
  const {
    network: { tables, useStore },
  } = useMUD();

  // store match data
  const matches = useStore((state) => state.getRecords(tables.MatchConfig));

  // State to keep track of the selected match index
  const [selectedMatchIndex, setSelectedMatchIndex] = useState<number | null>(null);

  const selectedMatchEntity = useStore((state) => {
    return Object.values(state.getRecords(tables.MatchIndex))
      .find(record => record.value.matchIndex === selectedMatchIndex)?.key.matchEntity || null;
  });

  const handleMatchSelect = (matchIndex: number) => {
    setSelectedMatchIndex(matchIndex);
  };


  return (
    <div>
      <div className="text-3xl">Sky Strife matches</div>

      <div className="m-2">
        {/* Match Selector Component */}
        <MatchSelector onMatchSelect={handleMatchSelect} />

        {/* Conditionally render the Match component if a match index is selected */}
        {selectedMatchEntity && <Match matchEntity={selectedMatchEntity} />}

        {/* Conditionally render the PlayersList component if a match entity is selected */}
        {selectedMatchEntity && <PlayersList matchEntity={selectedMatchEntity} />}
      </div>

      <hr style={{ height: '4px', backgroundColor: 'black', border: 'none' }} />

      <div className="text-2xl">All Matches</div>

      <div className="m-2">
        {/* All Matches Component */}
        {Object.values(matches).map((record) => (
          <div key={record.id}>
            <Match matchEntity={record.key.key} />
          </div>
        ))}
      </div>

    </div>
  );
}
