set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.1846, <2> 14.0744, <3> 38.4027, <4> 29.7207, <5> 20.592, <6> 29.2962, <7> 2.7456, <8> 1.4125, <9> 12.7048, <10> 1.4113, <11> 37.487, <12> 27.2974, <13> 49.7219, <14> 38.8986, <15> 37.965, <16> 48.0263, <17> 7.4548, <18> 8.6059, <19> 7.3551, <20> 22.0714;
param workload[JOB] := <1> 6.495, <2> 3.7516, <3> 6.197, <4> 5.4517, <5> 4.5378, <6> 5.4126, <7> 1.657, <8> 1.1885, <9> 3.5644, <10> 1.188, <11> 6.1227, <12> 5.2247, <13> 7.0514, <14> 6.2369, <15> 6.1616, <16> 6.9301, <17> 2.7303, <18> 2.9336, <19> 2.712, <20> 4.698;
param capacity[MACHINE] := <1> 90.2449, <2> 90.2449, <3> 90.2449, <4> 90.2449, <5> 90.2449, <6> 90.2449;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
