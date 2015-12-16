set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.8685, <2> 18.4781, <3> 32.9173, <4> 22.0679, <5> 29.1305, <6> 13.9028, <7> 26.0582, <8> 29.8167, <9> 22.9785, <10> 20.1962, <11> 24.7152, <12> 26.239, <13> 26.4111, <14> 24.8779, <15> 16.8476, <16> 22.6203, <17> 34.6355, <18> 20.9524, <19> 25.5951, <20> 26.7168;
param workload[JOB] := <1> 4.2271, <2> 4.2986, <3> 5.7374, <4> 4.6976, <5> 5.3973, <6> 3.7286, <7> 5.1047, <8> 5.4605, <9> 4.7936, <10> 4.494, <11> 4.9714, <12> 5.1224, <13> 5.1392, <14> 4.9878, <15> 4.1046, <16> 4.7561, <17> 5.8852, <18> 4.5774, <19> 5.0592, <20> 5.1688;
param capacity[MACHINE] := <1> 12.214, <2> 12.214, <3> 12.214, <4> 12.214, <5> 12.214, <6> 12.214;

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
