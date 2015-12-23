set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.266, <2> 34.6049, <3> 5.0052, <4> 43.3812, <5> 19.884, <6> 31.0384, <7> 40.9072, <8> 2.9133, <9> 45.7528, <10> 34.0768, <11> 24.7029, <12> 6.0953, <13> 31.5669, <14> 47.3149, <15> 44.4769, <16> 6.1836, <17> 40.8519, <18> 17.6375, <19> 30.7533, <20> 34.5734;
param workload[JOB] := <1> 2.8751, <2> 5.8826, <3> 2.2372, <4> 6.5864, <5> 4.4591, <6> 5.5712, <7> 6.3959, <8> 1.7068, <9> 6.7641, <10> 5.8375, <11> 4.9702, <12> 2.4689, <13> 5.6184, <14> 6.8786, <15> 6.6691, <16> 2.4867, <17> 6.3915, <18> 4.1997, <19> 5.5456, <20> 5.8799;
param capacity[MACHINE] := <1> 99.4245, <2> 99.4245, <3> 99.4245, <4> 99.4245, <5> 99.4245, <6> 99.4245, <7> 99.4245;

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
