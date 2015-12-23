set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.8528, <2> 20.2756, <3> 26.7558, <4> 23.8545, <5> 21.4221, <6> 27.7866, <7> 35.5059, <8> 25.7101, <9> 22.986, <10> 31.016, <11> 17.3291, <12> 26.0641, <13> 23.0692, <14> 22.8797, <15> 28.3339, <16> 28.3672, <17> 26.5963, <18> 21.9788, <19> 44.2582, <20> 21.8142;
param workload[JOB] := <1> 5.182, <2> 4.5028, <3> 5.1726, <4> 4.8841, <5> 4.6284, <6> 5.2713, <7> 5.9587, <8> 5.0705, <9> 4.7944, <10> 5.5692, <11> 4.1628, <12> 5.1053, <13> 4.803, <14> 4.7833, <15> 5.323, <16> 5.3261, <17> 5.1572, <18> 4.6882, <19> 6.6527, <20> 4.6706;
param capacity[MACHINE] := <1> 101.7062, <2> 101.7062, <3> 101.7062, <4> 101.7062, <5> 101.7062, <6> 101.7062, <7> 101.7062;

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
