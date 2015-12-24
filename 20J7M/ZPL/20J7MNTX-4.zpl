set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.2147, <2> 27.0443, <3> 23.9074, <4> 23.6335, <5> 29.7516, <6> 26.1102, <7> 22.7826, <8> 24.7356, <9> 18.3797, <10> 28.4883, <11> 32.985, <12> 25.6766, <13> 24.4902, <14> 25.6315, <15> 21.0715, <16> 18.4602, <17> 31.1464, <18> 28.4365, <19> 23.0326, <20> 23.7815;
param workload[JOB] := <1> 5.8493, <2> 5.2004, <3> 4.8895, <4> 4.8614, <5> 5.4545, <6> 5.1098, <7> 4.7731, <8> 4.9735, <9> 4.2872, <10> 5.3374, <11> 5.7433, <12> 5.0672, <13> 4.9488, <14> 5.0628, <15> 4.5904, <16> 4.2965, <17> 5.5809, <18> 5.3326, <19> 4.7992, <20> 4.8766;
param capacity[MACHINE] := <1> 10.8251, <2> 10.8251, <3> 10.8251, <4> 10.8251, <5> 10.8251, <6> 10.8251, <7> 10.8251;

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
