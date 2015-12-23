set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.5632, <2> 23.7372, <3> 22.915, <4> 20.8191, <5> 20.31, <6> 32.8485, <7> 22.9846, <8> 17.8156, <9> 30.9929, <10> 34.5819, <11> 25.5197, <12> 20.3559, <13> 31.1223, <14> 14.9796, <15> 20.8525, <16> 26.2104, <17> 21.6173, <18> 23.3854, <19> 25.0797, <20> 31.1173;
param workload[JOB] := <1> 7.4911, <2> 7.8919, <3> 46.7661, <4> 43.1443, <5> 3.6529, <6> 9.8186, <7> 2.5983, <8> 11.3265, <9> 41.1469, <10> 3.4645, <11> 45.9635, <12> 20.5732, <13> 10.0542, <14> 48.9742, <15> 2.8923, <16> 38.1754, <17> 43.6186, <18> 3.9022, <19> 9.3519, <20> 40.1128;
param capacity[MACHINE] := <1> 47.2414, <2> 47.2414, <3> 47.2414, <4> 47.2414, <5> 47.2414, <6> 47.2414, <7> 47.2414;

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
