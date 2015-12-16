set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9575, <2> 28.8265, <3> 23.693, <4> 21.2561, <5> 14.5445, <6> 19.8187, <7> 40.0628, <8> 33.399, <9> 27.6374, <10> 24.41, <11> 30.8909, <12> 19.8939, <13> 17.287, <14> 25.9943, <15> 26.8023, <16> 25.7461, <17> 18.9016, <18> 22.8393, <19> 11.9416, <20> 30.3749;
param workload[JOB] := <1> 13.5559, <2> 47.7334, <3> 33.8134, <4> 35.6762, <5> 13.2419, <6> 35.7324, <7> 30.1538, <8> 0.3802, <9> 18.7568, <10> 31.6495, <11> 47.7943, <12> 7.457, <13> 5.7601, <14> 1.3014, <15> 46.5914, <16> 46.7614, <17> 44.8365, <18> 47.6247, <19> 22.264, <20> 43.0974;
param capacity[MACHINE] := <1> 95.697, <2> 95.697, <3> 95.697, <4> 95.697, <5> 95.697, <6> 95.697;

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
